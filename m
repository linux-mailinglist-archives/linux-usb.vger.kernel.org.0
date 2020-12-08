Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4D32D3029
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 17:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730571AbgLHQsf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 11:48:35 -0500
Received: from avasout01.plus.net ([84.93.230.227]:38460 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbgLHQsf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 11:48:35 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id mg9QkyrWHn8O7mg9RkcPPO; Tue, 08 Dec 2020 16:47:48 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Ld6nFgXi c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=kj9zAlcOel0A:10 a=P1kZ4gAsAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=xZedZrcBONH4fSA2ZlIA:9 a=TmKCA33D4M_Q8TJU:21 a=fMauB7r55Ujl-SJb:21
 a=CjuIK1q_8ugA:10 a=fn9vMg-Z9CMH7MoVPInU:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com> <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk> <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com> <000001d6c89c$086812e0$193838a0$@perdrix.co.uk> <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk> <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com> <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk> <005601d6cc87$2fa608f0$8ef21ad0$@perdrix.co.uk> <36ac7a79c4b24f9f68b3543d18a51ec9af0a4933.camel@suse.com> <000701d6cd7c$236ec8b0$6a4c5a10$@perdrix.co.uk> <20201208162722.GC1298255@rowland.harvard.edu>
In-Reply-To: <20201208162722.GC1298255@rowland.harvard.edu>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Tue, 8 Dec 2020 16:47:44 -0000
Message-ID: <000801d6cd81$dc303370$94909a50$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHL9783AnoUJt6hZ/5IYeyCKGuS3gIDLrdIAl8/kcMBv69iRQHZtB/YAwjv7Y4DEjptYgIeJf4hAY/YFQcCuJVWHQFFQ+HNqVT7W6A=
Content-Language: en-gb
X-CMAE-Envelope: MS4wfKil0UX2p51R5BPZKFqVjHSf+z/bZcy8uuS2D9j8oov+gopxAU7h2jOb2eyyzCFok7q+Qtlh5LPmnP5M+zJ4KpZ0wf3WBUzFuFTXSq16FQyxMASWFfaM
 5HZtEBu0kpl5Z0Xmpq3myF29kuyR0WCfaACX5IqZxdsWRCj+tOFjkdltBW38siFriXofD8P5nlN2Ew==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>This is puzzling.  The device connected at SuperSpeed in the previous
tests.  Clearly this is related to the warning in the preceding line (the
port failed to configure its link partner).

>What could have happened?  A problem in the cable?

Previous test was using a 3m long cable.

Tried again with a 1m cable:

Dec 08 16:38:30 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device
number 2 using xhci_hcd
Dec 08 16:38:30 charon kernel: usb 2-1: New USB device found, idVendor=059f,
idProduct=105f, bcdDevice= 0.01
Dec 08 16:38:30 charon kernel: usb 2-1: New USB device strings: Mfr=2,
Product=3, SerialNumber=1
Dec 08 16:38:30 charon kernel: usb 2-1: Product: 2Big Quadra USB3
Dec 08 16:38:30 charon kernel: usb 2-1: Manufacturer: LaCie
Dec 08 16:38:30 charon kernel: usb 2-1: SerialNumber: 00000000250e9e711084
Dec 08 16:38:30 charon kernel: scsi host5: uas
Dec 08 16:38:30 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big
Quadra v3   051E PQ: 0 ANSI: 6
Dec 08 16:38:30 charon kernel: scsi 5:0:0:0: Attached scsi generic sg3 type
0
Dec 08 16:38:30 charon mtp-probe[15990]: checking bus 2, device 2:
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 08 16:38:30 charon mtp-probe[15990]: bus: 2, device: 2 was not an MTP
device
Dec 08 16:38:30 charon mtp-probe[15993]: checking bus 2, device 2:
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 08 16:38:30 charon mtp-probe[15993]: bus: 2, device: 2 was not an MTP
device
Dec 08 16:38:30 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical
blocks: (4.00 TB/3.64 TiB)
Dec 08 16:38:30 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
Dec 08 16:38:30 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
Dec 08 16:38:30 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read
cache: enabled, doesn't support DPO or FUA
Dec 08 16:38:30 charon kernel: sd 5:0:0:0: [sdc] Optimal transfer size
33553920 bytes
Dec 08 16:38:30 charon kernel:  sdc: sdc1 sdc2
Dec 08 16:38:30 charon kernel: sd 5:0:0:0: [sdc] Attached SCSI disk
Dec 08 16:38:31 charon sshd[15980]: Accepted password for amonra from
192.168.129.64 port 59740 ssh2
Dec 08 16:38:31 charon sshd[15980]: pam_unix(sshd:session): session opened
for user amonra by (uid=0)
Dec 08 16:38:31 charon systemd-logind[773]: New session 19 of user amonra.
Dec 08 16:38:31 charon systemd[1]: Started Session 19 of user amonra.
Dec 08 16:38:32 charon /usr/sbin/x2gocleansessions[899]:
amonra-50-1607445512_stDLXQt_dp32: state file for this session does not
exist: /tmp>
Dec 08 16:38:34 charon /usr/bin/x2gostartagent[16250]: successfully started
X2Go Agent session with ID amonra-50-1607445512_stDLXQt_dp32
Dec 08 16:38:41 charon /usr/bin/x2goruncommand[16445]: launching session
with Xsession-x2go mechanism, using STARTUP="startlxqt"
Dec 08 16:38:41 charon /usr/bin/x2goruncommand[16446]: dbus wrapper
available as /usr/bin/dbus-run-session
Dec 08 16:38:41 charon /usr/bin/x2gomountdirs[16312]: successfully mounted
amonra@127.0.0.1:42471/cygdrive/C/Users/amonra/X2GO~1/S-BA8C~1/sp>
Dec 08 16:38:42 charon polkitd(authority=local)[760]: Registered
Authentication Agent for unix-session:19 (system bus name :1.148 [/usr/bin/>
Dec 08 16:38:42 charon NetworkManager[730]: <info>  [1607445522.3927]
agent-manager: agent[c5fafd67353e3850,:1.150/org.freedesktop.nm-applet>
Dec 08 16:38:49 charon polkitd(authority=local)[760]: Operator of
unix-session:19 successfully authenticated as unix-user:amonra to gain ONE>
Dec 08 16:38:49 charon kernel: [EXFAT] trying to mount...
Dec 08 16:38:49 charon kernel: [EXFAT] mounted successfully
Dec 08 16:38:49 charon systemd[1]: Finished Clean the /media/amonra/4TB
mount point.
Dec 08 16:38:49 charon udisksd[775]: Mounted /dev/sdc2 at /media/amonra/4TB
on behalf of uid 1000

I then tried again using the 3m long cable and got the same error as before
and connected at high-speed not SuperSpeed

Should I expect problems with a 3m long cable or does this say the 3m long
cable is faulty? 

David

-----Original Message-----
From: Alan Stern <stern@rowland.harvard.edu> 
Sent: 08 December 2020 16:27
To: David C. Partridge <david.partridge@perdrix.co.uk>
Cc: 'Oliver Neukum' <oneukum@suse.com>; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

On Tue, Dec 08, 2020 at 04:06:49PM -0000, David C. Partridge wrote:
> >> 2-1: USB disconnect, device number 2
> 
> >Again, did you plug the cable or did the device spontaneously disconnect?
> 
> That was a spontaneous disconnect.
> 
> > In this case, could you retry with
> > usb-storage quirks=059f:105f:kf
> 
> Sure! The results are in general a lot more promising (apart from the
first line) - plus I was able to read/write files without problems:
> 
> Dec 08 15:47:48 charon kernel: usb usb2-port6: config error Dec 08 
> 15:47:49 charon kernel: usb 1-6: new high-speed USB device number 4 
> using xhci_hcd

This is puzzling.  The device connected at SuperSpeed in the previous tests.
Clearly this is related to the warning in the preceding line (the port
failed to configure its link partner).

What could have happened?  A problem in the cable?

The usb-storage quirk setting would not have affected this.

Alan Stern

