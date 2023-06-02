import android.content.Context
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager

class WifiUtils(private val context: Context) {

    private val wifiManager: WifiManager =
        context.applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager

    fun connectToWifi(ssid: String, password: String): Boolean {
        val wifiConfig = WifiConfiguration()
        wifiConfig.SSID = String.format("\"%s\"", ssid)
        wifiConfig.preSharedKey = String.format("\"%s\"", password)

        val networkId = wifiManager.addNetwork(wifiConfig)
        wifiManager.disconnect()

        val enableNetwork = wifiManager.enableNetwork(networkId, true)
        wifiManager.reconnect()

        return enableNetwork
    }
}
