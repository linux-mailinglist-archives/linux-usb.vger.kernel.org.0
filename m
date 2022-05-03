Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380115185FC
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 15:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236581AbiECOAf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 10:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbiECOAd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 10:00:33 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3871827FE3
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 06:56:58 -0700 (PDT)
Received: (qmail 1085702 invoked by uid 1000); 3 May 2022 09:56:57 -0400
Date:   Tue, 3 May 2022 09:56:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <YnE0qfgw74eAA/02@rowland.harvard.edu>
References: <YmFpMFlTt83s90an@rowland.harvard.edu>
 <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
 <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
 <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
 <YmrnVHA2/kttJQJa@rowland.harvard.edu>
 <1cb1cd1178703b4a67db849cc4c074b0c00b1332.camel@puri.sm>
 <YmxI5rIlyxOrPBHD@rowland.harvard.edu>
 <fdc8354e39f9162bcc63ab99f237bdbbe30d6017.camel@puri.sm>
 <YnAx3uvVrK4UXd05@rowland.harvard.edu>
 <d7a74ca6-589b-61d8-bb5b-aacfb83b6da0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7a74ca6-589b-61d8-bb5b-aacfb83b6da0@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 03, 2022 at 09:36:16AM +0200, Oliver Neukum wrote:
> 
> 
> On 02.05.22 21:32, Alan Stern wrote:
> 
> Hi,
> 
> I am happy to help, if I can.
> > The usbmon trace shows that quite a lot happens during re-enumeration 
> > that doesn't happen during the reset-resume.  No doubt the reason for 
> > this is that the cdc-wdm driver doesn't have a real reset-resume 
> > handler; the operations it carries out for a reset-resume are the same 
> > as for a normal resume, and that clearly is not appropriate here.
> Doing reset_resume() for WDM is problematic. The whole point
> of WDM as a protocol is to put the configuration of a device
> into user space. What is a kernel driver to do in that case.?
> > For example, the usbmon trace shows that the kernel sends a 
> > Set-Interface request to the modem during re-enumeration and then does a 
> > whole lot of probing that I don't understand.  None of this stuff 
> > happens during the reset-resume.  Probably the modem decides that 
> > without any of this extra configuration, it doesn't need to do 
> > anything -- and that's why it disconnects itself.
> >
> 
> Are you sure that stuff comes from CDC-WDM in the case of reenumeration?
> WDM does not do set_interface() in any case.

No, I'm not at all sure where it comes from.  The kernel log mentions 
option and qmi_wwan, which may be relevant.

The email message containing the detailed usbmon trace and kernel log 
seems not to have gotten into the mailing list archives.  I'll put a 
copy of the log below for your reference.  (I can send the usbmon trace 
too, if you want to see it.)

Alan Stern


Apr 23 08:40:12.653806 pureos kernel: usb 1-1.2: usb auto-suspend, wakeup 1 - usbmon timestamp: 2311281195
Apr 23 08:40:12.677790 pureos kernel: hub 1-1:1.0: hub_suspend - usbmon timestamp: 2311304057
Apr 23 08:40:12.701770 pureos kernel: usb 1-1: usb auto-suspend, wakeup 1 - usbmon timestamp: 2311328158
Apr 23 08:40:12.729785 pureos kernel: hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
Apr 23 08:40:12.754308 pureos kernel: usb 1-1: usb wakeup-resume - usbmon timestamp: 2311380045
Apr 23 08:40:12.774292 pureos kernel: usb 1-1: Waited 0ms for CONNECT
Apr 23 08:40:12.775803 pureos kernel: usb 1-1: finish resume
Apr 23 08:40:12.776877 pureos kernel: hub 1-1:1.0: hub_resume - usbmon timestamp: 2311400717
Apr 23 08:40:12.777982 pureos kernel: usb 1-1-port1: status 0507 change 0000
Apr 23 08:40:12.778118 pureos kernel: usb 1-1-port2: status 0101 change 0005
Apr 23 08:40:12.882293 pureos kernel: usb usb1-port1: resume, status 0
Apr 23 08:40:12.882720 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg 0004 evt 0000
Apr 23 08:40:12.901864 pureos kernel: usb 1-1.2: usb wakeup-resume - usbmon timestamp: 2311528048
Apr 23 08:40:12.925809 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
Apr 23 08:40:12.927336 pureos kernel: usb 1-1.2: finish reset-resume
Apr 23 08:40:13.033801 pureos kernel: usb 1-1.2: reset high-speed USB device number 8 using xhci-hcd
Apr 23 08:40:13.162832 pureos kernel: usb 1-1-port2: resume, status 0
Apr 23 08:40:13.163251 pureos kernel: usb 1-1-port2: status 0101, change 0004, 12 Mb/s
Apr 23 08:40:13.163448 pureos kernel: usb 1-1.2: USB disconnect, device number 8
Apr 23 08:40:13.164732 pureos kernel: usb 1-1.2: unregistering device
Apr 23 08:40:13.165999 pureos kernel: option1 ttyUSB0: GSM modem (1-port) converter now disconnected from ttyUSB0
Apr 23 08:40:13.166329 pureos kernel: option 1-1.2:1.0: device disconnected
Apr 23 08:40:13.170341 pureos kernel: option1 ttyUSB1: GSM modem (1-port) converter now disconnected from ttyUSB1
Apr 23 08:40:13.170874 pureos kernel: option 1-1.2:1.1: device disconnected
Apr 23 08:40:13.171193 pureos kernel: option1 ttyUSB2: GSM modem (1-port) converter now disconnected from ttyUSB2
Apr 23 08:40:13.171405 pureos kernel: option 1-1.2:1.2: device disconnected
Apr 23 08:40:13.171625 pureos kernel: option1 ttyUSB3: GSM modem (1-port) converter now disconnected from ttyUSB3
Apr 23 08:40:13.171822 pureos kernel: option 1-1.2:1.3: device disconnected
Apr 23 08:40:13.178717 pureos kernel: qmi_wwan 1-1.2:1.4 wwx0254efef4d47: unregister 'qmi_wwan' usb-xhci-hcd.4.auto-1.2, WWAN/QMI device
Apr 23 08:40:13.173382 pureos systemd-networkd[386]: wwx0254efef4d47: Link DOWN
Apr 23 08:40:13.173668 pureos ModemManager[573]: Cannot read from istream: connection broken
Apr 23 08:40:13.173423 pureos systemd-networkd[386]: wwx0254efef4d47: Lost carrier
Apr 23 08:40:13.173790 pureos ModemManager[573]: [/dev/cdc-wdm0] QMI endpoint hangup: removed
Apr 23 08:40:13.178093 pureos systemd-timesyncd[460]: No network connectivity, watching for changes.
Apr 23 08:40:13.173850 pureos ModemManager[573]: <info>  [modem6] connection to qmi-proxy for /dev/cdc-wdm0 lost, reprobing
Apr 23 08:40:13.183805 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_modem_unavailable() Disabling Bearer Handler
Apr 23 08:40:13.174943 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'wds' client with flags 'release-cid'...
Apr 23 08:40:13.183841 pureos mmsdtng[748]: ../src/service.c:mms_service_set_bearer_handler() service 0xaaaaea6c1cf0 handler (nil)
Apr 23 08:40:13.174993 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'wds' client with ID '3'
Apr 23 08:40:13.183865 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_disconnect_from_sms_wap() Stopping watching SMS WAPs
Apr 23 08:40:13.175165 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'wds' client with flags 'release-cid'...
Apr 23 08:40:13.184369 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Modem vanished, Disabling plugin
Apr 23 08:40:13.175206 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'wds' client with ID '2'
Apr 23 08:40:13.184395 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() MMSD_MM_STATE_NO_MODEM
Apr 23 08:40:13.175307 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'voice' client with flags 'release-cid'...
Apr 23 08:40:13.184423 pureos mmsdtng[748]: ../plugins/modemmanager.c:cb_object_removed() Modem removed: /org/freedesktop/ModemManager1/Modem/6
Apr 23 08:40:13.180791 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'voice' client with ID '2'
Apr 23 08:40:13.195056 pureos NetworkManager[497]: <info>  [1650696013.1949] device (cdc-wdm0): state change: activated -> unmanaged (reason 'removed', sys-iface-state: 'removed')
Apr 23 08:40:13.190435 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'pdc' client with flags 'release-cid'...
Apr 23 08:40:13.190496 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'pdc' client with ID '1'
Apr 23 08:40:13.190665 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'loc' client with flags 'release-cid'...
Apr 23 08:40:13.190706 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'loc' client with ID '1'
Apr 23 08:40:13.190811 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'uim' client with flags 'release-cid'...
Apr 23 08:40:13.190856 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'uim' client with ID '1'
Apr 23 08:40:13.190958 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'wms' client with flags 'release-cid'...
Apr 23 08:40:13.190997 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'wms' client with ID '1'
Apr 23 08:40:13.191100 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'wds' client with flags 'release-cid'...
Apr 23 08:40:13.191145 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'wds' client with ID '1'
Apr 23 08:40:13.191257 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'nas' client with flags 'release-cid'...
Apr 23 08:40:13.191297 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'nas' client with ID '1'
Apr 23 08:40:13.191407 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'dms' client with flags 'release-cid'...
Apr 23 08:40:13.191447 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'dms' client with ID '1'
Apr 23 08:40:13.230747 pureos NetworkManager[497]: <info>  [1650696013.2306] manager: NetworkManager state is now DISCONNECTED
Apr 23 08:40:13.237015 pureos upowerd[845]: treating change event as add on /sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2
Apr 23 08:40:13.277335 pureos ModemManager[573]: <info>  [base-manager] port ttyUSB1 released by device '/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2'
Apr 23 08:40:13.286260 pureos ModemManager[573]: <info>  [base-manager] port ttyUSB2 released by device '/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2'
Apr 23 08:40:13.291472 pureos ModemManager[573]: <info>  [base-manager] port ttyUSB0 released by device '/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2'
Apr 23 08:40:13.295778 pureos ModemManager[573]: <info>  [base-manager] port ttyUSB3 released by device '/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2'
Apr 23 08:40:13.306334 pureos kernel: usb 1-1.2: new high-speed USB device number 9 using xhci-hcd
Apr 23 08:40:13.329268 pureos ModemManager[573]: <info>  [base-manager] port cdc-wdm0 released by device '/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2'
Apr 23 08:40:13.331681 pureos NetworkManager[497]: <warn>  [1650696013.3315] dns-sd-resolved[85a0ffe846d22b1a]: send-updates SetLinkDomains@7 failed: GDBus.Error:org.freedesktop.resolve1.NoSuchLink: Link 7 not known
Apr 23 08:40:13.388236 pureos dbus-daemon[486]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service' requested by ':1.9' (uid=0 pid=497 comm="/usr/sbin/NetworkManager --no-daemon ")
Apr 23 08:40:13.398537 pureos systemd[1]: Starting Network Manager Script Dispatcher Service...
Apr 23 08:40:13.406276 pureos kernel: usb 1-1.2: udev 9, busnum 1, minor = 8
Apr 23 08:40:13.407671 pureos kernel: usb 1-1.2: New USB device found, idVendor=2020, idProduct=2060, bcdDevice= 0.00
Apr 23 08:40:13.408775 pureos kernel: usb 1-1.2: New USB device strings: Mfr=3, Product=2, SerialNumber=4
Apr 23 08:40:13.409778 pureos kernel: usb 1-1.2: Product: Qualcomm CDMA Technologies MSM
Apr 23 08:40:13.410753 pureos kernel: usb 1-1.2: Manufacturer: Qualcomm, Incorporated
Apr 23 08:40:13.427146 pureos NetworkManager[497]: <warn>  [1650696013.4270] modem-broadband[cdc-wdm0]: failed to disconnect modem: GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: No such interface “org.freedesktop.ModemManager1.Modem.Simple” on object at path /org/freedesktop/ModemManager1/Modem/6
Apr 23 08:40:13.428954 pureos ModemManager[573]: <info>  [base-manager] port wwx0254efef4d47 released by device '/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2'
Apr 23 08:40:13.514548 pureos kernel: option 1-1.2:1.0: GSM modem (1-port) converter detected
Apr 23 08:40:13.519078 pureos kernel: usb 1-1.2: GSM modem (1-port) converter now attached to ttyUSB0
Apr 23 08:40:13.520372 pureos kernel: option 1-1.2:1.1: GSM modem (1-port) converter detected
Apr 23 08:40:13.524791 pureos kernel: usb 1-1.2: GSM modem (1-port) converter now attached to ttyUSB1
Apr 23 08:40:13.531525 pureos kernel: option 1-1.2:1.2: GSM modem (1-port) converter detected
Apr 23 08:40:13.533448 pureos kernel: usb 1-1.2: GSM modem (1-port) converter now attached to ttyUSB2
Apr 23 08:40:13.536436 pureos kernel: option 1-1.2:1.3: GSM modem (1-port) converter detected
Apr 23 08:40:13.538577 pureos kernel: usb 1-1.2: GSM modem (1-port) converter now attached to ttyUSB3
Apr 23 08:40:13.528423 pureos systemd[1]: Started Network Manager Script Dispatcher Service.
Apr 23 08:40:13.526818 pureos dbus-daemon[486]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
Apr 23 08:40:13.547926 pureos kernel: qmi_wwan 1-1.2:1.4: cdc-wdm0: USB WDM device
Apr 23 08:40:13.550669 pureos kernel: qmi_wwan 1-1.2:1.4 wwan0: register 'qmi_wwan' at usb-xhci-hcd.4.auto-1.2, WWAN/QMI device, 02:54:ef:ef:4d:47
Apr 23 08:40:13.562725 pureos upowerd[845]: treating change event as add on /sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2
Apr 23 08:40:13.631393 pureos mtp-probe[4156]: checking bus 1, device 9: "/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2"
Apr 23 08:40:13.660094 pureos mtp-probe[4156]: bus: 1, device: 9 was not an MTP device
Apr 23 08:40:13.718475 pureos upowerd[845]: treating change event as add on /sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2
Apr 23 08:40:13.792506 pureos systemd-udevd[4135]: Using default interface naming scheme 'v247'.
Apr 23 08:40:13.808553 pureos systemd-udevd[4135]: ethtool: autonegotiation is unset or enabled, the speed and duplex are not writable.
Apr 23 08:40:13.813814 pureos kernel: qmi_wwan 1-1.2:1.4 wwx0254efef4d47: renamed from wwan0
Apr 23 08:40:13.844331 pureos systemd-networkd[386]: wwan0: Interface name change detected, wwan0 has been renamed to wwx0254efef4d47.
Apr 23 08:40:13.940121 pureos dbus-daemon[756]: [session uid=1000 pid=756] Activating via systemd: service name='org.freedesktop.Tracker1.Miner.Extract' unit='tracker-extract.service' requested by ':1.3' (uid=1000 pid=754 comm="/usr/libexec/tracker-miner-fs ")
Apr 23 08:40:14.014749 pureos systemd[730]: Starting Tracker metadata extractor...
Apr 23 08:40:14.087366 pureos tracker-extract[4193]: Set scheduler policy to SCHED_IDLE
Apr 23 08:40:14.092298 pureos tracker-extract[4193]: Setting priority nice level to 19
Apr 23 08:40:14.128385 pureos mtp-probe[4196]: checking bus 1, device 9: "/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2"
Apr 23 08:40:14.166884 pureos mtp-probe[4196]: bus: 1, device: 9 was not an MTP device
Apr 23 08:40:14.180618 pureos systemd-udevd[4137]: Using default interface naming scheme 'v247'.
Apr 23 08:40:14.186303 pureos systemd-udevd[4137]: ethtool: autonegotiation is unset or enabled, the speed and duplex are not writable.
Apr 23 08:40:14.214499 pureos goa-daemon[816]: goa_http_client_check() failed: 2 — Fehler beim Auflösen von »cloud.puri.sm«: Der Name oder der Dienst ist nicht bekannt
Apr 23 08:40:14.215420 pureos goa-daemon[816]: /org/gnome/OnlineAccounts/Accounts/account_1638277513_0: Setting AttentionNeeded to TRUE because EnsureCredentials() failed with: Ungültiges Passwort für Benutzer »martin.kepplinger@puri.sm« (goa-error-quark, 0): Rechnername konnte nicht aufgelöst werden (goa-error-quark, 4)
Apr 23 08:40:15.011361 pureos dbus-daemon[756]: [session uid=1000 pid=756] Successfully activated service 'org.freedesktop.Tracker1.Miner.Extract'
Apr 23 08:40:15.014491 pureos systemd[730]: Started Tracker metadata extractor.
Apr 23 08:40:15.218774 pureos goa-daemon[816]: goa_http_client_check() failed: 2 — Fehler beim Auflösen von »cloud.puri.sm«: Der Name oder der Dienst ist nicht bekannt
Apr 23 08:40:15.337345 pureos ModemManager[573]: [/dev/cdc-wdm0] Opening device with flags 'version-info, proxy'...
Apr 23 08:40:15.337935 pureos ModemManager[573]: [/dev/cdc-wdm0] created endpoint
Apr 23 08:40:15.342367 pureos ModemManager[573]: [/dev/cdc-wdm0] Checking version info (45 retries)...
Apr 23 08:40:15.349704 pureos ModemManager[573]: [/dev/cdc-wdm0] QMI Device supports 30 services:
Apr 23 08:40:15.349807 pureos ModemManager[573]: [/dev/cdc-wdm0]    ctl (1.5)
Apr 23 08:40:15.349838 pureos ModemManager[573]: [/dev/cdc-wdm0]    wds (1.67)
Apr 23 08:40:15.349868 pureos ModemManager[573]: [/dev/cdc-wdm0]    dms (1.0)
Apr 23 08:40:15.349896 pureos ModemManager[573]: [/dev/cdc-wdm0]    nas (1.25)
Apr 23 08:40:15.349925 pureos ModemManager[573]: [/dev/cdc-wdm0]    qos (1.12)
Apr 23 08:40:15.349954 pureos ModemManager[573]: [/dev/cdc-wdm0]    wms (1.10)
Apr 23 08:40:15.349983 pureos ModemManager[573]: [/dev/cdc-wdm0]    auth (1.3)
Apr 23 08:40:15.350011 pureos ModemManager[573]: [/dev/cdc-wdm0]    at (1.4)
Apr 23 08:40:15.350039 pureos ModemManager[573]: [/dev/cdc-wdm0]    voice (2.1)
Apr 23 08:40:15.350067 pureos ModemManager[573]: [/dev/cdc-wdm0]    cat2 (2.24)
Apr 23 08:40:15.350095 pureos ModemManager[573]: [/dev/cdc-wdm0]    uim (1.46)
Apr 23 08:40:15.350123 pureos ModemManager[573]: [/dev/cdc-wdm0]    pbm (1.4)
Apr 23 08:40:15.350151 pureos ModemManager[573]: [/dev/cdc-wdm0]    test (1.0)
Apr 23 08:40:15.350179 pureos ModemManager[573]: [/dev/cdc-wdm0]    loc (2.0)
Apr 23 08:40:15.350206 pureos ModemManager[573]: [/dev/cdc-wdm0]    sar (1.0)
Apr 23 08:40:15.350234 pureos ModemManager[573]: [/dev/cdc-wdm0]    ims (1.0)
Apr 23 08:40:15.350266 pureos ModemManager[573]: [/dev/cdc-wdm0]    csd (1.0)
Apr 23 08:40:15.350294 pureos ModemManager[573]: [/dev/cdc-wdm0]    ts (1.0)
Apr 23 08:40:15.350322 pureos ModemManager[573]: [/dev/cdc-wdm0]    tmd (1.0)
Apr 23 08:40:15.350350 pureos ModemManager[573]: [/dev/cdc-wdm0]    wda (1.16)
Apr 23 08:40:15.350379 pureos ModemManager[573]: [/dev/cdc-wdm0]    csvt (1.1)
Apr 23 08:40:15.350408 pureos ModemManager[573]: [/dev/cdc-wdm0]    imsp (1.0)
Apr 23 08:40:15.350730 pureos ModemManager[573]: [/dev/cdc-wdm0]    imsa (1.0)
Apr 23 08:40:15.350767 pureos ModemManager[573]: [/dev/cdc-wdm0]    coex (1.0)
Apr 23 08:40:15.350798 pureos ModemManager[573]: [/dev/cdc-wdm0]    pdc (1.0)
Apr 23 08:40:15.350827 pureos ModemManager[573]: [/dev/cdc-wdm0]    rfrpe (1.0)
Apr 23 08:40:15.350856 pureos ModemManager[573]: [/dev/cdc-wdm0]    dsd (1.0)
Apr 23 08:40:15.350887 pureos ModemManager[573]: [/dev/cdc-wdm0]    unknown [0x2d] (1.0)
Apr 23 08:40:15.350916 pureos ModemManager[573]: [/dev/cdc-wdm0]    unknown [0x30] (1.0)
Apr 23 08:40:15.350943 pureos ModemManager[573]: [/dev/cdc-wdm0]    unknown [0x36] (1.0)
Apr 23 08:40:16.331469 pureos ModemManager[573]: <info>  [device /sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2] creating modem with plugin 'broadmobi' and '6' ports
Apr 23 08:40:16.334533 pureos ModemManager[573]: <info>  [base-manager] modem for device '/sys/devices/platform/soc@0/38200000.usb/xhci-hcd.4.auto/usb1/1-1/1-1.2' successfully created
Apr 23 08:40:16.334739 pureos ModemManager[573]: [/dev/cdc-wdm0] Opening device with flags 'version-info, proxy'...
Apr 23 08:40:16.335175 pureos ModemManager[573]: [/dev/cdc-wdm0] created endpoint
Apr 23 08:40:16.337322 pureos ModemManager[573]: [/dev/cdc-wdm0] Checking version info (45 retries)...
Apr 23 08:40:16.341555 pureos ModemManager[573]: [/dev/cdc-wdm0] QMI Device supports 30 services:
Apr 23 08:40:16.341602 pureos ModemManager[573]: [/dev/cdc-wdm0]    ctl (1.5)
Apr 23 08:40:16.341632 pureos ModemManager[573]: [/dev/cdc-wdm0]    wds (1.67)
Apr 23 08:40:16.341660 pureos ModemManager[573]: [/dev/cdc-wdm0]    dms (1.0)
Apr 23 08:40:16.341690 pureos ModemManager[573]: [/dev/cdc-wdm0]    nas (1.25)
Apr 23 08:40:16.341738 pureos ModemManager[573]: [/dev/cdc-wdm0]    qos (1.12)
Apr 23 08:40:16.341771 pureos ModemManager[573]: [/dev/cdc-wdm0]    wms (1.10)
Apr 23 08:40:16.341800 pureos ModemManager[573]: [/dev/cdc-wdm0]    auth (1.3)
Apr 23 08:40:16.341829 pureos ModemManager[573]: [/dev/cdc-wdm0]    at (1.4)
Apr 23 08:40:16.341857 pureos ModemManager[573]: [/dev/cdc-wdm0]    voice (2.1)
Apr 23 08:40:16.341884 pureos ModemManager[573]: [/dev/cdc-wdm0]    cat2 (2.24)
Apr 23 08:40:16.341914 pureos ModemManager[573]: [/dev/cdc-wdm0]    uim (1.46)
Apr 23 08:40:16.341942 pureos ModemManager[573]: [/dev/cdc-wdm0]    pbm (1.4)
Apr 23 08:40:16.341970 pureos ModemManager[573]: [/dev/cdc-wdm0]    test (1.0)
Apr 23 08:40:16.341999 pureos ModemManager[573]: [/dev/cdc-wdm0]    loc (2.0)
Apr 23 08:40:16.342027 pureos ModemManager[573]: [/dev/cdc-wdm0]    sar (1.0)
Apr 23 08:40:16.342056 pureos ModemManager[573]: [/dev/cdc-wdm0]    ims (1.0)
Apr 23 08:40:16.342085 pureos ModemManager[573]: [/dev/cdc-wdm0]    csd (1.0)
Apr 23 08:40:16.342114 pureos ModemManager[573]: [/dev/cdc-wdm0]    ts (1.0)
Apr 23 08:40:16.342142 pureos ModemManager[573]: [/dev/cdc-wdm0]    tmd (1.0)
Apr 23 08:40:16.342170 pureos ModemManager[573]: [/dev/cdc-wdm0]    wda (1.16)
Apr 23 08:40:16.342198 pureos ModemManager[573]: [/dev/cdc-wdm0]    csvt (1.1)
Apr 23 08:40:16.342227 pureos ModemManager[573]: [/dev/cdc-wdm0]    imsp (1.0)
Apr 23 08:40:16.342255 pureos ModemManager[573]: [/dev/cdc-wdm0]    imsa (1.0)
Apr 23 08:40:16.342282 pureos ModemManager[573]: [/dev/cdc-wdm0]    coex (1.0)
Apr 23 08:40:16.342310 pureos ModemManager[573]: [/dev/cdc-wdm0]    pdc (1.0)
Apr 23 08:40:16.342338 pureos ModemManager[573]: [/dev/cdc-wdm0]    rfrpe (1.0)
Apr 23 08:40:16.342367 pureos ModemManager[573]: [/dev/cdc-wdm0]    dsd (1.0)
Apr 23 08:40:16.342397 pureos ModemManager[573]: [/dev/cdc-wdm0]    unknown [0x2d] (1.0)
Apr 23 08:40:16.342425 pureos ModemManager[573]: [/dev/cdc-wdm0]    unknown [0x30] (1.0)
Apr 23 08:40:16.342454 pureos ModemManager[573]: [/dev/cdc-wdm0]    unknown [0x36] (1.0)
Apr 23 08:40:16.342590 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.345805 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'wda' (version 1.16) client with ID '1'
Apr 23 08:40:16.351668 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.351832 pureos ModemManager[573]: [/dev/cdc-wdm0] Releasing 'wda' client with flags 'release-cid'...
Apr 23 08:40:16.351874 pureos ModemManager[573]: [/dev/cdc-wdm0] Unregistered 'wda' client with ID '1'
Apr 23 08:40:16.356077 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'dms' (version 1.0) client with ID '1'
Apr 23 08:40:16.356153 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.360039 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'nas' (version 1.25) client with ID '1'
Apr 23 08:40:16.360114 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.366150 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'wds' (version 1.67) client with ID '1'
Apr 23 08:40:16.366228 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.369578 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'wms' (version 1.10) client with ID '1'
Apr 23 08:40:16.369858 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.373631 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'uim' (version 1.46) client with ID '1'
Apr 23 08:40:16.373706 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.377591 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'loc' (version 2.0) client with ID '1'
Apr 23 08:40:16.377662 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.381060 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'pdc' (version 1.0) client with ID '1'
Apr 23 08:40:16.381137 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.385090 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'voice' (version 2.1) client with ID '2'
Apr 23 08:40:16.452902 pureos ModemManager[573]: <warn>  [modem7] couldn't query SIM slots: QMI protocol error (94): 'NotSupported'
Apr 23 08:40:16.525289 pureos ModemManager[573]: <warn>  [modem7/sim6] couldn't load list of emergency numbers: uninitialized emergency numbers list
Apr 23 08:40:16.650604 pureos ModemManager[573]: <info>  [modem7] state changed (unknown -> disabled)
Apr 23 08:40:16.677306 pureos mmsdtng[748]: ../plugins/modemmanager.c:cb_object_added() cb_object_added
Apr 23 08:40:16.679627 pureos mmsdtng[748]: New Object with Messaging feature found, Adding...
Apr 23 08:40:16.680648 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_add_object() Not checking for a default Modem
Apr 23 08:40:16.681611 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_add_object() Added device at: /org/freedesktop/ModemManager1/Modem/7
Apr 23 08:40:16.682685 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_init_modem() mmsd_mm_init_modem
Apr 23 08:40:16.685897 pureos NetworkManager[497]: <info>  [1650696016.6857] modem["cdc-wdm0"]: modem state changed, 'disabled' --> 'enabling' (reason: user preference)
Apr 23 08:40:16.689921 pureos NetworkManager[497]: <info>  [1650696016.6898] manager: (cdc-wdm0): new Broadband device (/org/freedesktop/NetworkManager/Devices/8)
Apr 23 08:40:16.693981 pureos NetworkManager[497]: <info>  [1650696016.6938] device (cdc-wdm0): state change: unmanaged -> unavailable (reason 'managed', sys-iface-state: 'external')
Apr 23 08:40:16.697684 pureos NetworkManager[497]: <info>  [1650696016.6975] device (cdc-wdm0): modem state 'enabling'
Apr 23 08:40:16.702416 pureos NetworkManager[497]: <info>  [1650696016.7022] device (cdc-wdm0): state change: unavailable -> disconnected (reason 'none', sys-iface-state: 'managed')
Apr 23 08:40:16.704895 pureos NetworkManager[497]: <info>  [1650696016.7047] policy: auto-activating connection 'HoT' (c9aa442f-4ae3-4752-974d-6208792de208)
Apr 23 08:40:16.707675 pureos NetworkManager[497]: <info>  [1650696016.7075] device (cdc-wdm0): Activation: starting connection 'HoT' (c9aa442f-4ae3-4752-974d-6208792de208)
Apr 23 08:40:16.708267 pureos NetworkManager[497]: <info>  [1650696016.7082] device (cdc-wdm0): state change: disconnected -> prepare (reason 'none', sys-iface-state: 'managed')
Apr 23 08:40:16.714585 pureos NetworkManager[497]: <info>  [1650696016.7144] manager: NetworkManager state is now CONNECTING
Apr 23 08:40:16.751327 pureos mmsdtng[748]: ../src/service.c:mms_service_set_country_code() Service Country Code set to AT
Apr 23 08:40:16.752138 pureos mmsdtng[748]: ../src/service.c:mms_service_set_own_number() Service own number set
Apr 23 08:40:16.752201 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_connect_to_sms_wap() Watching for new SMS WAPs
Apr 23 08:40:16.752266 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() Something May be wrong with the modem, checking....
Apr 23 08:40:16.752292 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() MM_MODEM_STATE_DISABLED
Apr 23 08:40:16.752318 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Modem disabled
Apr 23 08:40:16.752341 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() MMSD_MM_STATE_MODEM_DISABLED
Apr 23 08:40:16.752364 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Disabling Bearer Handler
Apr 23 08:40:16.752389 pureos mmsdtng[748]: ../src/service.c:mms_service_set_bearer_handler() service 0xaaaaea6c1cf0 handler (nil)
Apr 23 08:40:16.768383 pureos mmsdtng[748]: ../src/service.c:handle_method_call_manager() At Get Services Method Call
Apr 23 08:40:16.789417 pureos mmsdtng[748]: ../src/service.c:handle_method_call_service() Retrieving all Messages...
Apr 23 08:40:16.789493 pureos mmsdtng[748]: ../src/service.c:handle_method_call_service() No Messages!
Apr 23 08:40:16.822795 pureos ModemManager[573]: <info>  [modem7] state changed (disabled -> enabling)
Apr 23 08:40:16.831513 pureos mmsdtng[748]: ../plugins/modemmanager.c:modem_state_changed_cb() State Change: Old State: 3 New State: 5, Reason: 1
Apr 23 08:40:16.831574 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() Something May be wrong with the modem, checking....
Apr 23 08:40:16.831599 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() MM_MODEM_STATE_ENABLING
Apr 23 08:40:16.831623 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Modem disabled
Apr 23 08:40:16.831644 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() MMSD_MM_STATE_MODEM_DISABLED
Apr 23 08:40:16.831669 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Disabling Bearer Handler
Apr 23 08:40:16.834962 pureos ModemManager[573]: <info>  [modem7] power state updated: on
Apr 23 08:40:16.831696 pureos mmsdtng[748]: ../src/service.c:mms_service_set_bearer_handler() service 0xaaaaea6c1cf0 handler (nil)
Apr 23 08:40:16.839704 pureos ModemManager[573]: <info>  [modem7] simple connect started...
Apr 23 08:40:16.839805 pureos ModemManager[573]: <info>  [modem7] simple connect state (4/8): wait to get fully enabled
Apr 23 08:40:16.913042 pureos ModemManager[573]: <info>  [modem7] state changed (enabling -> enabled)
Apr 23 08:40:16.913244 pureos ModemManager[573]: <info>  [modem7] simple connect state (5/8): register
Apr 23 08:40:16.917943 pureos ModemManager[573]: <info>  [modem7] 3GPP registration state changed (unknown -> registering)
Apr 23 08:40:16.920700 pureos NetworkManager[497]: <info>  [1650696016.9205] modem["cdc-wdm0"]: modem state changed, 'enabling' --> 'enabled' (reason: user-requested)
Apr 23 08:40:16.921192 pureos mmsdtng[748]: ../plugins/modemmanager.c:modem_state_changed_cb() State Change: Old State: 5 New State: 6, Reason: 1
Apr 23 08:40:16.921221 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() MM_MODEM_GOOD_STATE: 6
Apr 23 08:40:16.921245 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() MMSD_MM_STATE_READY
Apr 23 08:40:16.921268 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Setting Bearer Handler
Apr 23 08:40:16.921293 pureos mmsdtng[748]: ../src/service.c:mms_service_set_bearer_handler() service 0xaaaaea6c1cf0 handler 0xaaaae09a52f0
Apr 23 08:40:16.921318 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_get_all_sms() Queue Search for all SMS
Apr 23 08:40:16.924842 pureos ModemManager[573]: <info>  [modem7] 3GPP registration state changed (registering -> home)
Apr 23 08:40:16.925031 pureos ModemManager[573]: <info>  [modem7] state changed (enabled -> registered)
Apr 23 08:40:16.928260 pureos ModemManager[573]: <info>  [modem7] simple connect state (6/8): bearer
Apr 23 08:40:16.931994 pureos NetworkManager[497]: <info>  [1650696016.9318] modem["cdc-wdm0"]: modem state changed, 'enabled' --> 'registered' (reason: unknown)
Apr 23 08:40:16.935170 pureos ModemManager[573]: <info>  [modem7] simple connect state (7/8): connect
Apr 23 08:40:16.937529 pureos ModemManager[573]: <info>  [modem7] state changed (registered -> connecting)
Apr 23 08:40:16.939634 pureos mmsdtng[748]: ../plugins/modemmanager.c:modem_state_changed_cb() State Change: Old State: 6 New State: 8, Reason: 0
Apr 23 08:40:16.941081 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:16.939692 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() MM_MODEM_GOOD_STATE: 8
Apr 23 08:40:16.939717 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() MMSD_MM_STATE_READY
Apr 23 08:40:16.939740 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Setting Bearer Handler
Apr 23 08:40:16.939766 pureos mmsdtng[748]: ../src/service.c:mms_service_set_bearer_handler() service 0xaaaaea6c1cf0 handler 0xaaaae09a52f0
Apr 23 08:40:16.948575 pureos mmsdtng[748]: ../plugins/modemmanager.c:modem_state_changed_cb() State Change: Old State: 8 New State: 10, Reason: 1
Apr 23 08:40:16.948607 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() MM_MODEM_GOOD_STATE: 10
Apr 23 08:40:16.948631 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() MMSD_MM_STATE_READY
Apr 23 08:40:16.948654 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Setting Bearer Handler
Apr 23 08:40:16.948680 pureos mmsdtng[748]: ../src/service.c:mms_service_set_bearer_handler() service 0xaaaaea6c1cf0 handler 0xaaaae09a52f0
Apr 23 08:40:16.956714 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'wds' (version 1.67) client with ID '2'
Apr 23 08:40:16.952008 pureos NetworkManager[497]: <info>  [1650696016.9518] modem["cdc-wdm0"]: modem state changed, 'registered' --> 'connecting' (reason: user-requested)
Apr 23 08:40:17.014186 pureos ModemManager[573]: <info>  [modem7/bearer9] QMI IPv4 Settings:
Apr 23 08:40:17.014262 pureos ModemManager[573]: <info>  [modem7/bearer9]     address: 10.151.253.61/30
Apr 23 08:40:17.014302 pureos ModemManager[573]: <info>  [modem7/bearer9]     gateway: 10.151.253.62
Apr 23 08:40:17.014337 pureos ModemManager[573]: <info>  [modem7/bearer9]     DNS #1: 213.162.70.9
Apr 23 08:40:17.014370 pureos ModemManager[573]: <info>  [modem7/bearer9]     DNS #2: 213.162.70.25
Apr 23 08:40:17.014404 pureos ModemManager[573]: <info>  [modem7/bearer9]        MTU: 1500
Apr 23 08:40:17.014478 pureos ModemManager[573]: [/dev/cdc-wdm0] Allocating new client ID...
Apr 23 08:40:17.017977 pureos ModemManager[573]: [/dev/cdc-wdm0] Registered 'wds' (version 1.67) client with ID '3'
Apr 23 08:40:17.035198 pureos ModemManager[573]: <info>  [modem7/bearer9] couldn't start network: QMI protocol error (14): 'CallFailed'
Apr 23 08:40:17.035260 pureos ModemManager[573]: <info>  [modem7/bearer9] verbose call end reason (2,237): [internal] interface-in-use
Apr 23 08:40:17.036155 pureos ModemManager[573]: <info>  [modem7] state changed (connecting -> connected)
Apr 23 08:40:17.037027 pureos ModemManager[573]: <info>  [modem7] simple connect state (8/8): all done
Apr 23 08:40:17.042875 pureos mmsdtng[748]: ../plugins/modemmanager.c:modem_state_changed_cb() State Change: Old State: 10 New State: 11, Reason: 1
Apr 23 08:40:17.042909 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_modem_state() MM_MODEM_GOOD_STATE: 11
Apr 23 08:40:17.042933 pureos NetworkManager[497]: <info>  [1650696017.0428] modem["cdc-wdm0"]: modem state changed, 'connecting' --> 'connected' (reason: user-requested)
Apr 23 08:40:17.042934 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() MMSD_MM_STATE_READY
Apr 23 08:40:17.042959 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_state() Setting Bearer Handler
Apr 23 08:40:17.042984 pureos mmsdtng[748]: ../src/service.c:mms_service_set_bearer_handler() service 0xaaaaea6c1cf0 handler 0xaaaae09a52f0
Apr 23 08:40:17.043011 pureos mmsdtng[748]: ../plugins/modemmanager.c:process_mms_process_message_queue() Processing any unsent/unreceived MMS messages.
Apr 23 08:40:17.066838 pureos systemd-networkd[386]: wwx0254efef4d47: Link UP
Apr 23 08:40:17.066881 pureos systemd-networkd[386]: wwx0254efef4d47: Gained carrier
Apr 23 08:40:17.069398 pureos NetworkManager[497]: <info>  [1650696017.0693] device (cdc-wdm0): state change: prepare -> config (reason 'none', sys-iface-state: 'managed')
Apr 23 08:40:17.071330 pureos NetworkManager[497]: <info>  [1650696017.0712] device (cdc-wdm0): state change: config -> ip-config (reason 'none', sys-iface-state: 'managed')
Apr 23 08:40:17.072416 pureos NetworkManager[497]: <info>  [1650696017.0723] modem["cdc-wdm0"]: IPv6 configuration disabled
Apr 23 08:40:17.072538 pureos NetworkManager[497]: <info>  [1650696017.0724] modem-broadband[cdc-wdm0]: IPv4 static configuration:
Apr 23 08:40:17.072686 pureos NetworkManager[497]: <info>  [1650696017.0726] modem-broadband[cdc-wdm0]:   address 10.151.253.61/30
Apr 23 08:40:17.072755 pureos NetworkManager[497]: <info>  [1650696017.0727] modem-broadband[cdc-wdm0]:   gateway 10.151.253.62
Apr 23 08:40:17.072812 pureos NetworkManager[497]: <info>  [1650696017.0727] modem-broadband[cdc-wdm0]:   DNS 213.162.70.9
Apr 23 08:40:17.072863 pureos NetworkManager[497]: <info>  [1650696017.0728] modem-broadband[cdc-wdm0]:   DNS 213.162.70.25
Apr 23 08:40:17.072905 pureos NetworkManager[497]: <info>  [1650696017.0728] modem-broadband[cdc-wdm0]:   MTU 1500
Apr 23 08:40:17.081811 pureos systemd-timesyncd[460]: Network configuration changed, trying to establish connection.
Apr 23 08:40:17.100451 pureos NetworkManager[497]: <info>  [1650696017.1003] device (cdc-wdm0): state change: ip-config -> ip-check (reason 'none', sys-iface-state: 'managed')
Apr 23 08:40:17.133996 pureos NetworkManager[497]: <info>  [1650696017.1338] device (cdc-wdm0): state change: ip-check -> secondaries (reason 'none', sys-iface-state: 'managed')
Apr 23 08:40:17.135262 pureos NetworkManager[497]: <info>  [1650696017.1351] device (cdc-wdm0): state change: secondaries -> activated (reason 'none', sys-iface-state: 'managed')
Apr 23 08:40:17.137242 pureos NetworkManager[497]: <info>  [1650696017.1371] manager: NetworkManager state is now CONNECTED_LOCAL
Apr 23 08:40:17.147972 pureos NetworkManager[497]: <info>  [1650696017.1478] manager: NetworkManager state is now CONNECTED_SITE
Apr 23 08:40:17.158030 pureos NetworkManager[497]: <info>  [1650696017.1579] policy: set 'HoT' (wwx0254efef4d47) as default for IPv4 routing and DNS
Apr 23 08:40:17.162499 pureos NetworkManager[497]: <info>  [1650696017.1624] device (cdc-wdm0): Activation: successful, device activated.
Apr 23 08:40:17.647327 pureos NetworkManager[497]: <info>  [1650696017.6472] manager: NetworkManager state is now CONNECTED_GLOBAL
Apr 23 08:40:18.312412 pureos mmsdtng[748]: ../src/service.c:activate_bearer() service 0xaaaaea6c1cf0 setup 0 active 0
Apr 23 08:40:18.312462 pureos mmsdtng[748]: ../src/service.c:activate_bearer() service 0xaaaaea6c1cf0 waiting for 20 seconds
Apr 23 08:40:18.312501 pureos mmsdtng[748]: ../plugins/modemmanager.c:set_context() Setting Context...
Apr 23 08:40:18.312526 pureos mmsdtng[748]: ../src/service.c:mms_service_set_mmsc() service 0xaaaaea6c1cf0 mmsc http://mms.invalid
Apr 23 08:40:18.312581 pureos mmsdtng[748]: ../plugins/modemmanager.c:set_context() Max number of bearers: 1
Apr 23 08:40:18.322627 pureos mmsdtng[748]: ../plugins/modemmanager.c:set_context() Attempting to autoconfigure settings
Apr 23 08:40:18.322789 pureos mmsdtng[748]: ../src/service-providers.c:mmsd_service_providers_find_settings() mccmnc: 23207, apn: webaut
Apr 23 08:40:18.322972 pureos mmsdtng[748]: ../plugins/modemmanager.c:set_context() Current Context APN: webaut, mmsd-tng settings MMS APN: apn.invalid
Apr 23 08:40:18.323011 pureos mmsdtng[748]: ../plugins/modemmanager.c:set_context() The modem is not connected to the correct APN!
Apr 23 08:40:18.323036 pureos mmsdtng[748]: ../plugins/modemmanager.c:bearer_handler() Set MMSC: http://mms.invalid, Set Proxy: (null), Set MMS APN: apn.invalid
Apr 23 08:40:18.323614 pureos mmsdtng[748]: ../plugins/modemmanager.c:bearer_handler() At Bearer Handler: path /org/freedesktop/ModemManager1/Modem/7 active 1 context_active 0
Apr 23 08:40:18.323642 pureos mmsdtng[748]: ../plugins/modemmanager.c:bearer_handler() Error activating context!
Apr 23 08:40:18.323669 pureos mmsdtng[748]: ../src/service.c:mms_service_bearer_notify() service=0xaaaaea6c1cf0 active=0 iface=(null) proxy=(null)
Apr 23 08:40:18.326638 pureos chatty[1128]: Bearer Handler emitted an error, the APN set in mmsd's settings does not match any connected APNs
Apr 23 08:40:18.380135 pureos mmsdtng[748]: Could not find settings: Operator ID '23207' not found in service provider database
Apr 23 08:40:18.380183 pureos mmsdtng[748]: Your MMS settings are not in the database! Please file a merge request at https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info so they can be added
Apr 23 08:40:21.750279 pureos goa-daemon[816]: /org/gnome/OnlineAccounts/Accounts/account_1638277513_0: Setting AttentionNeeded to FALSE because EnsureCredentials() succeded
Apr 23 08:40:22.313948 pureos mmsdtng[748]: ../plugins/modemmanager.c:mmsd_mm_get_messaging_list() Searching for all SMS
Apr 23 08:40:25.417330 pureos systemd[730]: tracker-extract.service: Succeeded.
Apr 23 08:40:28.390580 pureos systemd[1]: NetworkManager-dispatcher.service: Succeeded.
Apr 23 08:40:38.621863 pureos kernel: usb 1-1.2: usb auto-suspend, wakeup 1 - usbmon timestamp: 2337251133
Apr 23 08:40:38.641795 pureos kernel: usb 1-1.2: usb auto-resume - usbmon timestamp: 2337268392
Apr 23 08:40:38.709825 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
Apr 23 08:40:38.711711 pureos kernel: usb 1-1.2: finish resume
