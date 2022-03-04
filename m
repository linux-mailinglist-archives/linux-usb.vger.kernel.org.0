Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67FD4CD2D7
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 11:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbiCDK4U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 05:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235998AbiCDK4N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 05:56:13 -0500
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr [80.12.242.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAF71AEECD
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 02:55:22 -0800 (PST)
Received: from localhost.localdomain ([106.133.37.8])
        by smtp.orange.fr with ESMTPA
        id Q5ZtnXEHtQTuBQ5a1n6ZAo; Fri, 04 Mar 2022 11:55:20 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: MDU0YmViZGZmMDIzYiBlMiM2NTczNTRjNWZkZTMwOGRiOGQ4ODf3NWI1ZTMyMzdiODlhOQ==
X-ME-Date: Fri, 04 Mar 2022 11:55:20 +0100
X-ME-IP: 106.133.37.8
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Kalle Valo <kvalo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Helmut Schaa <helmut.schaa@googlemail.com>,
        Duncan Sands <duncan.sands@free.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Olav Kongas <ok@artecdesign.ee>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        UNGLinuxDriver@microchip.com,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Leon Romanovsky <leon@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kees Cook <keescook@chromium.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        Thomas Toye <thomas@toye.io>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        Rajat Jain <rajatja@google.com>,
        Kelly Devilliv <kelly.devilliv@gmail.com>,
        Shubhankar Kuranagatti <shubhankarvk@gmail.com>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Will Deacon <will@kernel.org>,
        Davidlohr Bueso <dbueso@suse.de>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Peter Zijlstra <peterz@infradead.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Colin Ian King <colin.king@intel.com>,
        Len Baker <len.baker@gmx.com>,
        gushengxian <gushengxian@yulong.com>
Subject: [PATCH] usb: rework usb_maxpacket() and remove its third argument
Date:   Fri,  4 Mar 2022 19:53:50 +0900
Message-Id: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change the prototype of usb_maxpacket() from:
| static inline __u16
| usb_maxpacket(struct usb_device *udev, int pipe, int is_out)

into:
| static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)

and rewrite the function.

Rationale:

  * The third argument of usb_maxpacket(): is_out can be derived from
    its second one: pipe using usb_pipeout(pipe). Furthermore,
    usb_pipoout(pipe) is being called within usb_maxpacket()
    regardless to confirm the input.

  * This function is not exposed to the UAPI so return type should be
    u16, not __u16.

  * Let's not reinvent the wheel and rely on usb_endpoint_maxp() to
    make this a one liner function.

All the users of usb_endpoint_maxp() are then updated.

Two of the users: oxu210hp-hcd.c and isp1760-hcd.c rely on a local
macro: max_packet() to mask the maximum size. Because this masking is
already performed by usb_maxpacket(), this patch also removes these
redundant sanitization and remove the local macro if not needed any
more (keep it in oxu210hp-hcd.c which uses it elsewhere but remove it
in isp1760-hcd.c).

CC: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Ville Syrjala <syrjala@sci.fi>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Henk Vergonet <Henk.Vergonet@gmail.com>
CC: Sean Young <sean@mess.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Benjamin Valentin <benpicco@googlemail.com>
CC: Oliver Neukum <oliver@neukum.org>
CC: "David S. Miller" <davem@davemloft.net>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Woojung Huh <woojung.huh@microchip.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
CC: Ryder Lee <ryder.lee@mediatek.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Stanislaw Gruszka <stf_xl@wp.pl>
CC: Helmut Schaa <helmut.schaa@googlemail.com>
CC: Duncan Sands <duncan.sands@free.fr>
CC: Alan Stern <stern@rowland.harvard.edu>
CC: Olav Kongas <ok@artecdesign.ee>
CC: Rui Miguel Silva <rui.silva@linaro.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: Clemens Ladisch <clemens@ladisch.de>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/hid/usbhid/hid-core.c                 |  2 +-
 drivers/hid/usbhid/usbkbd.c                   |  2 +-
 drivers/hid/usbhid/usbmouse.c                 |  2 +-
 drivers/input/misc/ati_remote2.c              |  2 +-
 drivers/input/misc/cm109.c                    |  2 +-
 drivers/input/misc/powermate.c                |  2 +-
 drivers/input/misc/yealink.c                  |  2 +-
 drivers/input/tablet/acecad.c                 |  2 +-
 drivers/input/tablet/pegasus_notetaker.c      |  2 +-
 drivers/media/rc/ati_remote.c                 |  4 ++--
 drivers/media/rc/mceusb.c                     |  2 +-
 drivers/media/rc/streamzap.c                  |  2 +-
 drivers/media/rc/xbox_remote.c                |  2 +-
 drivers/media/usb/tm6000/tm6000-dvb.c         |  2 +-
 drivers/media/usb/tm6000/tm6000-input.c       |  2 +-
 drivers/media/usb/tm6000/tm6000-video.c       |  2 +-
 drivers/net/usb/cdc_ncm.c                     |  4 ++--
 drivers/net/usb/lan78xx.c                     |  4 ++--
 drivers/net/usb/rndis_host.c                  |  2 +-
 drivers/net/usb/usbnet.c                      |  4 ++--
 drivers/net/wireless/mediatek/mt76/usb.c      |  2 +-
 .../net/wireless/ralink/rt2x00/rt2x00usb.c    |  4 ++--
 drivers/usb/atm/usbatm.c                      |  2 +-
 drivers/usb/c67x00/c67x00-sched.c             |  4 ++--
 drivers/usb/core/hub.c                        |  2 +-
 drivers/usb/host/ehci-q.c                     |  4 ++--
 drivers/usb/host/fhci-hcd.c                   |  3 +--
 drivers/usb/host/fotg210-hcd.c                |  2 +-
 drivers/usb/host/isp116x-hcd.c                |  5 ++--
 drivers/usb/host/isp1362-hcd.c                |  6 ++---
 drivers/usb/host/max3421-hcd.c                |  6 ++---
 drivers/usb/host/ohci-hcd.c                   |  3 +--
 drivers/usb/host/oxu210hp-hcd.c               |  4 ++--
 drivers/usb/host/r8a66597-hcd.c               |  3 +--
 drivers/usb/host/sl811-hcd.c                  |  6 ++---
 drivers/usb/isp1760/isp1760-hcd.c             |  7 ++----
 drivers/usb/misc/ftdi-elan.c                  | 15 ++++--------
 drivers/usb/misc/lvstest.c                    |  2 +-
 drivers/usb/storage/onetouch.c                |  2 +-
 drivers/usb/storage/transport.c               |  2 +-
 include/linux/usb.h                           | 23 ++-----------------
 sound/usb/line6/pcm.c                         |  4 ++--
 sound/usb/midi.c                              |  4 ++--
 sound/usb/usx2y/usb_stream.c                  |  6 ++---
 sound/usb/usx2y/usbusx2yaudio.c               |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c               |  2 +-
 46 files changed, 71 insertions(+), 102 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 54752c85604b..4490e2f7252a 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -387,7 +387,7 @@ static int hid_submit_ctrl(struct hid_device *hid)
 
 		usbhid->urbctrl->pipe = usb_rcvctrlpipe(hid_to_usb_dev(hid), 0);
 		maxpacket = usb_maxpacket(hid_to_usb_dev(hid),
-					  usbhid->urbctrl->pipe, 0);
+					  usbhid->urbctrl->pipe);
 		len += (len == 0);	/* Don't allow 0-length reports */
 		len = round_up(len, maxpacket);
 		if (len > usbhid->bufsize)
diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index df02002066ce..b4b007c4beb6 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -279,7 +279,7 @@ static int usb_kbd_probe(struct usb_interface *iface,
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	kbd = kzalloc(sizeof(struct usb_kbd), GFP_KERNEL);
 	input_dev = input_allocate_device();
diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
index c89332017d5d..fb1d7d1f6999 100644
--- a/drivers/hid/usbhid/usbmouse.c
+++ b/drivers/hid/usbhid/usbmouse.c
@@ -123,7 +123,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	mouse = kzalloc(sizeof(struct usb_mouse), GFP_KERNEL);
 	input_dev = input_allocate_device();
diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
index 8a36d78fed63..946bf75aa106 100644
--- a/drivers/input/misc/ati_remote2.c
+++ b/drivers/input/misc/ati_remote2.c
@@ -639,7 +639,7 @@ static int ati_remote2_urb_init(struct ati_remote2 *ar2)
 			return -ENOMEM;
 
 		pipe = usb_rcvintpipe(udev, ar2->ep[i]->bEndpointAddress);
-		maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+		maxp = usb_maxpacket(udev, pipe);
 		maxp = maxp > 4 ? 4 : maxp;
 
 		usb_fill_int_urb(ar2->urb[i], udev, pipe, ar2->buf[i], maxp,
diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index f515fae465c3..728325a2d574 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -745,7 +745,7 @@ static int cm109_usb_probe(struct usb_interface *intf,
 
 	/* get a handle to the interrupt data pipe */
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	ret = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	ret = usb_maxpacket(udev, pipe);
 	if (ret != USB_PKT_LEN)
 		dev_err(&intf->dev, "invalid payload size %d, expected %d\n",
 			ret, USB_PKT_LEN);
diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
index c4e0e1886061..c1c733a9cb89 100644
--- a/drivers/input/misc/powermate.c
+++ b/drivers/input/misc/powermate.c
@@ -374,7 +374,7 @@ static int powermate_probe(struct usb_interface *intf, const struct usb_device_i
 
 	/* get a handle to the interrupt data pipe */
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 
 	if (maxp < POWERMATE_PAYLOAD_SIZE_MIN || maxp > POWERMATE_PAYLOAD_SIZE_MAX) {
 		printk(KERN_WARNING "powermate: Expected payload of %d--%d bytes, found %d bytes!\n",
diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
index 8ab01c7601b1..69420781db30 100644
--- a/drivers/input/misc/yealink.c
+++ b/drivers/input/misc/yealink.c
@@ -905,7 +905,7 @@ static int usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	/* get a handle to the interrupt data pipe */
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	ret = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	ret = usb_maxpacket(udev, pipe);
 	if (ret != USB_PKT_LEN)
 		dev_err(&intf->dev, "invalid payload size %d, expected %zd\n",
 			ret, USB_PKT_LEN);
diff --git a/drivers/input/tablet/acecad.c b/drivers/input/tablet/acecad.c
index a38d1fe97334..56c7e471ac32 100644
--- a/drivers/input/tablet/acecad.c
+++ b/drivers/input/tablet/acecad.c
@@ -130,7 +130,7 @@ static int usb_acecad_probe(struct usb_interface *intf, const struct usb_device_
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	acecad = kzalloc(sizeof(struct usb_acecad), GFP_KERNEL);
 	input_dev = input_allocate_device();
diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 749edbdb7ffa..c608ac505d1b 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -296,7 +296,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	pegasus->intf = intf;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	pegasus->data_len = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	pegasus->data_len = usb_maxpacket(dev, pipe);
 
 	pegasus->data = usb_alloc_coherent(dev, pegasus->data_len, GFP_KERNEL,
 					   &pegasus->data_dma);
diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index c12dda73cdd5..3155e876616d 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -773,7 +773,7 @@ static int ati_remote_initialize(struct ati_remote *ati_remote)
 
 	/* Set up irq_urb */
 	pipe = usb_rcvintpipe(udev, ati_remote->endpoint_in->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = (maxp > DATA_BUFSIZE) ? DATA_BUFSIZE : maxp;
 
 	usb_fill_int_urb(ati_remote->irq_urb, udev, pipe, ati_remote->inbuf,
@@ -784,7 +784,7 @@ static int ati_remote_initialize(struct ati_remote *ati_remote)
 
 	/* Set up out_urb */
 	pipe = usb_sndintpipe(udev, ati_remote->endpoint_out->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = (maxp > DATA_BUFSIZE) ? DATA_BUFSIZE : maxp;
 
 	usb_fill_int_urb(ati_remote->out_urb, udev, pipe, ati_remote->outbuf,
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 2dc810f5a73f..0834d5f866fd 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1728,7 +1728,7 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		pipe = usb_rcvintpipe(dev, ep_in->bEndpointAddress);
 	else
 		pipe = usb_rcvbulkpipe(dev, ep_in->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	ir = kzalloc(sizeof(struct mceusb_dev), GFP_KERNEL);
 	if (!ir)
diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 16ba85d7c090..deb85330c940 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -307,7 +307,7 @@ static int streamzap_probe(struct usb_interface *intf,
 	}
 
 	pipe = usb_rcvintpipe(usbdev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(usbdev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(usbdev, pipe);
 
 	if (maxp == 0) {
 		dev_err(&intf->dev, "%s: endpoint Max Packet Size is 0!?!\n",
diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index 98d0b43608ad..7424b2031152 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -171,7 +171,7 @@ static int xbox_remote_initialize(struct xbox_remote *xbox_remote,
 
 	/* Set up irq_urb */
 	pipe = usb_rcvintpipe(udev, endpoint_in->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = (maxp > DATA_BUFSIZE) ? DATA_BUFSIZE : maxp;
 
 	usb_fill_int_urb(xbox_remote->irq_urb, udev, pipe, xbox_remote->inbuf,
diff --git a/drivers/media/usb/tm6000/tm6000-dvb.c b/drivers/media/usb/tm6000/tm6000-dvb.c
index 4990fa886d7a..335f747b0375 100644
--- a/drivers/media/usb/tm6000/tm6000-dvb.c
+++ b/drivers/media/usb/tm6000/tm6000-dvb.c
@@ -120,7 +120,7 @@ static int tm6000_start_stream(struct tm6000_core *dev)
 	pipe = usb_rcvbulkpipe(dev->udev, dev->bulk_in.endp->desc.bEndpointAddress
 							  & USB_ENDPOINT_NUMBER_MASK);
 
-	size = usb_maxpacket(dev->udev, pipe, usb_pipeout(pipe));
+	size = usb_maxpacket(dev->udev, pipe);
 	size = size * 15; /* 512 x 8 or 12 or 15 */
 
 	dvb->bulk_urb->transfer_buffer = kzalloc(size, GFP_KERNEL);
diff --git a/drivers/media/usb/tm6000/tm6000-input.c b/drivers/media/usb/tm6000/tm6000-input.c
index 84602edf3fe8..5136e9e202f1 100644
--- a/drivers/media/usb/tm6000/tm6000-input.c
+++ b/drivers/media/usb/tm6000/tm6000-input.c
@@ -340,7 +340,7 @@ static int __tm6000_ir_int_start(struct rc_dev *rc)
 		dev->int_in.endp->desc.bEndpointAddress
 		& USB_ENDPOINT_NUMBER_MASK);
 
-	size = usb_maxpacket(dev->udev, pipe, usb_pipeout(pipe));
+	size = usb_maxpacket(dev->udev, pipe);
 	dprintk(1, "IR max size: %d\n", size);
 
 	ir->int_urb->transfer_buffer = kzalloc(size, GFP_ATOMIC);
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index e293f6f3d1bc..d855a19551f3 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -570,7 +570,7 @@ static int tm6000_prepare_isoc(struct tm6000_core *dev)
 			       dev->isoc_in.endp->desc.bEndpointAddress &
 			       USB_ENDPOINT_NUMBER_MASK);
 
-	size = usb_maxpacket(dev->udev, pipe, usb_pipeout(pipe));
+	size = usb_maxpacket(dev->udev, pipe);
 
 	if (size > dev->isoc_in.maxsize)
 		size = dev->isoc_in.maxsize;
diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 15f91d691bba..63ce9d81f61b 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -441,7 +441,7 @@ static void cdc_ncm_update_rxtx_max(struct usbnet *dev, u32 new_rx, u32 new_tx)
 	 * .bind which is called before usbnet sets up dev->maxpacket
 	 */
 	if (val != le32_to_cpu(ctx->ncm_parm.dwNtbOutMaxSize) &&
-	    val % usb_maxpacket(dev->udev, dev->out, 1) == 0)
+	    val % usb_maxpacket(dev->udev, dev->out) == 0)
 		val++;
 
 	/* we might need to flush any pending tx buffers if running */
@@ -465,7 +465,7 @@ static void cdc_ncm_update_rxtx_max(struct usbnet *dev, u32 new_rx, u32 new_tx)
 	usbnet_update_max_qlen(dev);
 
 	/* never pad more than 3 full USB packets per transfer */
-	ctx->min_tx_pkt = clamp_t(u16, ctx->tx_max - 3 * usb_maxpacket(dev->udev, dev->out, 1),
+	ctx->min_tx_pkt = clamp_t(u16, ctx->tx_max - 3 * usb_maxpacket(dev->udev, dev->out),
 				  CDC_NCM_MIN_TX_PKT, ctx->tx_max);
 }
 
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index b8e20a3f2b84..7d35b683e005 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -4426,7 +4426,7 @@ static int lan78xx_probe(struct usb_interface *intf,
 		goto out4;
 
 	period = ep_intr->desc.bInterval;
-	maxp = usb_maxpacket(dev->udev, dev->pipe_intr, 0);
+	maxp = usb_maxpacket(dev->udev, dev->pipe_intr);
 	buf = kmalloc(maxp, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
@@ -4444,7 +4444,7 @@ static int lan78xx_probe(struct usb_interface *intf,
 		dev->urb_intr->transfer_flags |= URB_FREE_BUFFER;
 	}
 
-	dev->maxpacket = usb_maxpacket(dev->udev, dev->pipe_out, 1);
+	dev->maxpacket = usb_maxpacket(dev->udev, dev->pipe_out);
 
 	/* Reject broken descriptors. */
 	if (dev->maxpacket == 0) {
diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index 247f58cb0f84..de0b00bd2eca 100644
--- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -333,7 +333,7 @@ generic_rndis_bind(struct usbnet *dev, struct usb_interface *intf, int flags)
 	net->hard_header_len += sizeof (struct rndis_data_hdr);
 	dev->hard_mtu = net->mtu + net->hard_header_len;
 
-	dev->maxpacket = usb_maxpacket(dev->udev, dev->out, 1);
+	dev->maxpacket = usb_maxpacket(dev->udev, dev->out);
 	if (dev->maxpacket == 0) {
 		netif_dbg(dev, probe, dev->net,
 			  "dev->maxpacket can't be 0\n");
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9a6450f796dc..d5bf5733b277 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -229,7 +229,7 @@ static int init_status (struct usbnet *dev, struct usb_interface *intf)
 	pipe = usb_rcvintpipe (dev->udev,
 			dev->status->desc.bEndpointAddress
 				& USB_ENDPOINT_NUMBER_MASK);
-	maxp = usb_maxpacket (dev->udev, pipe, 0);
+	maxp = usb_maxpacket(dev->udev, pipe);
 
 	/* avoid 1 msec chatter:  min 8 msec poll rate */
 	period = max ((int) dev->status->desc.bInterval,
@@ -1789,7 +1789,7 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
 
 	if (!dev->rx_urb_size)
 		dev->rx_urb_size = dev->hard_mtu;
-	dev->maxpacket = usb_maxpacket (dev->udev, dev->out, 1);
+	dev->maxpacket = usb_maxpacket(dev->udev, dev->out);
 	if (dev->maxpacket == 0) {
 		/* that is a broken device */
 		status = -ENODEV;
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 0a7006c8959b..f84ea6996352 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -1132,7 +1132,7 @@ int mt76u_init(struct mt76_dev *dev,
 
 	INIT_WORK(&usb->stat_work, mt76u_tx_status_data);
 
-	usb->data_len = usb_maxpacket(udev, usb_sndctrlpipe(udev, 0), 1);
+	usb->data_len = usb_maxpacket(udev, usb_sndctrlpipe(udev, 0));
 	if (usb->data_len < 32)
 		usb->data_len = 32;
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index 74c3d8cb3100..0827bc860bf8 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -586,10 +586,10 @@ static void rt2x00usb_assign_endpoint(struct data_queue *queue,
 
 	if (queue->qid == QID_RX) {
 		pipe = usb_rcvbulkpipe(usb_dev, queue->usb_endpoint);
-		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe, 0);
+		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe);
 	} else {
 		pipe = usb_sndbulkpipe(usb_dev, queue->usb_endpoint);
-		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe, 1);
+		queue->usb_maxpacket = usb_maxpacket(usb_dev, pipe);
 	}
 
 	if (!queue->usb_maxpacket)
diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index e3a49d837609..362217189ef3 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -1091,7 +1091,7 @@ int usbatm_usb_probe(struct usb_interface *intf, const struct usb_device_id *id,
 			snd_buf_bytes - (snd_buf_bytes % instance->tx_channel.stride));
 
 	/* rx buffer size must be a positive multiple of the endpoint maxpacket */
-	maxpacket = usb_maxpacket(usb_dev, instance->rx_channel.endpoint, 0);
+	maxpacket = usb_maxpacket(usb_dev, instance->rx_channel.endpoint);
 
 	if ((maxpacket < 1) || (maxpacket > UDSL_MAX_BUF_SIZE)) {
 		dev_err(dev, "%s: invalid endpoint %02x!\n", __func__,
diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
index c7d3e907be81..a09fa68a6ce7 100644
--- a/drivers/usb/c67x00/c67x00-sched.c
+++ b/drivers/usb/c67x00/c67x00-sched.c
@@ -655,7 +655,7 @@ static int c67x00_add_data_urb(struct c67x00_hcd *c67x00, struct urb *urb)
 			       usb_pipeout(urb->pipe));
 	remaining = urb->transfer_buffer_length - urb->actual_length;
 
-	maxps = usb_maxpacket(urb->dev, urb->pipe, usb_pipeout(urb->pipe));
+	maxps = usb_maxpacket(urb->dev, urb->pipe);
 
 	need_empty = (urb->transfer_flags & URB_ZERO_PACKET) &&
 	    usb_pipeout(urb->pipe) && !(remaining % maxps);
@@ -866,7 +866,7 @@ static inline int c67x00_end_of_data(struct c67x00_td *td)
 	if (unlikely(!act_bytes))
 		return 1;	/* This was an empty packet */
 
-	maxps = usb_maxpacket(td_udev(td), td->pipe, usb_pipeout(td->pipe));
+	maxps = usb_maxpacket(td_udev(td), td->pipe);
 
 	if (unlikely(act_bytes < maxps))
 		return 1;	/* Smaller then full packet */
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1460857026e0..7781b2d31473 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1635,7 +1635,7 @@ static int hub_configure(struct usb_hub *hub,
 	 * maxpktsize is defined in hcd.c's fake endpoint descriptors
 	 * to be big enough for at least USB_MAXCHILDREN ports. */
 	pipe = usb_rcvintpipe(hdev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(hdev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(hdev, pipe);
 
 	if (maxp > sizeof(*hub->buffer))
 		maxp = sizeof(*hub->buffer);
diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index a2a5c2996350..1163af6fad77 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -645,7 +645,7 @@ qh_urb_transaction (
 		token |= (1 /* "in" */ << 8);
 	/* else it's already initted to "out" pid (0 << 8) */
 
-	maxpacket = usb_maxpacket(urb->dev, urb->pipe, !is_input);
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
@@ -1218,7 +1218,7 @@ static int ehci_submit_single_step_set_feature(
 
 	token |= (1 /* "in" */ << 8);  /*This is IN stage*/
 
-	maxpacket = usb_maxpacket(urb->dev, urb->pipe, 0);
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	qtd_fill(ehci, qtd, buf, len, token, maxpacket);
 
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index a8e1048278d0..2ba09c3fbc2f 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -408,8 +408,7 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 			size++;
 		else if ((urb->transfer_flags & URB_ZERO_PACKET) != 0
 			 && (urb->transfer_buffer_length
-			     % usb_maxpacket(urb->dev, pipe,
-					     usb_pipeout(pipe))) != 0)
+			     % usb_maxpacket(urb->dev, pipe)) != 0)
 			size++;
 		break;
 	case PIPE_ISOCHRONOUS:
diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index c3fd375b4778..f8c111e08a0d 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -2596,7 +2596,7 @@ static struct list_head *qh_urb_transaction(struct fotg210_hcd *fotg210,
 		token |= (1 /* "in" */ << 8);
 	/* else it's already initted to "out" pid (0 << 8) */
 
-	maxpacket = usb_maxpacket(urb->dev, urb->pipe, !is_input);
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 8835f6bd528e..70ce03d01435 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -726,7 +726,7 @@ static int isp116x_urb_enqueue(struct usb_hcd *hcd,
 		INIT_LIST_HEAD(&ep->schedule);
 		ep->udev = udev;
 		ep->epnum = epnum;
-		ep->maxpacket = usb_maxpacket(udev, urb->pipe, is_out);
+		ep->maxpacket = usb_maxpacket(udev, urb->pipe);
 		usb_settoggle(udev, epnum, is_out, 0);
 
 		if (type == PIPE_CONTROL) {
@@ -757,8 +757,7 @@ static int isp116x_urb_enqueue(struct usb_hcd *hcd,
 			ep->load = usb_calc_bus_time(udev->speed,
 						     !is_out,
 						     (type == PIPE_ISOCHRONOUS),
-						     usb_maxpacket(udev, pipe,
-								   is_out)) /
+						     usb_maxpacket(udev, pipe)) /
 			    1000;
 		}
 		hep->hcpriv = ep;
diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index d8610ce8f2ec..0e14d1d07709 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -1279,7 +1279,7 @@ static int isp1362_urb_enqueue(struct usb_hcd *hcd,
 		ep->udev = usb_get_dev(udev);
 		ep->hep = hep;
 		ep->epnum = epnum;
-		ep->maxpacket = usb_maxpacket(udev, urb->pipe, is_out);
+		ep->maxpacket = usb_maxpacket(udev, urb->pipe);
 		ep->ptd_offset = -EINVAL;
 		ep->ptd_index = -EINVAL;
 		usb_settoggle(udev, epnum, is_out, 0);
@@ -1299,8 +1299,8 @@ static int isp1362_urb_enqueue(struct usb_hcd *hcd,
 			ep->interval = urb->interval;
 			ep->branch = PERIODIC_SIZE;
 			ep->load = usb_calc_bus_time(udev->speed, !is_out,
-						     (type == PIPE_ISOCHRONOUS),
-						     usb_maxpacket(udev, pipe, is_out)) / 1000;
+						     type == PIPE_ISOCHRONOUS,
+						     usb_maxpacket(udev, pipe)) / 1000;
 			break;
 		}
 		hep->hcpriv = ep;
diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 30de85a707fe..3a48f544dcdf 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -546,7 +546,7 @@ max3421_transfer_out(struct usb_hcd *hcd, struct urb *urb, int fast_retransmit)
 		return MAX3421_HXFR_BULK_OUT(epnum);
 	}
 
-	max_packet = usb_maxpacket(urb->dev, urb->pipe, 1);
+	max_packet = usb_maxpacket(urb->dev, urb->pipe);
 
 	if (max_packet > MAX3421_FIFO_SIZE) {
 		/*
@@ -952,7 +952,7 @@ max3421_transfer_in_done(struct usb_hcd *hcd, struct urb *urb)
 	 * USB 2.0 Section 5.3.2 Pipes: packets must be full size
 	 * except for last one.
 	 */
-	max_packet = usb_maxpacket(urb->dev, urb->pipe, 0);
+	max_packet = usb_maxpacket(urb->dev, urb->pipe);
 	if (max_packet > MAX3421_FIFO_SIZE) {
 		/*
 		 * We do not support isochronous transfers at this
@@ -998,7 +998,7 @@ max3421_transfer_out_done(struct usb_hcd *hcd, struct urb *urb)
 		 * max_packet as an indicator that the end of the
 		 * packet has been reached).
 		 */
-		u32 max_packet = usb_maxpacket(urb->dev, urb->pipe, 1);
+		u32 max_packet = usb_maxpacket(urb->dev, urb->pipe);
 
 		if (max3421_hcd->curr_len == max_packet)
 			return 0;
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 666b1c665188..c4c821c2288c 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -181,8 +181,7 @@ static int ohci_urb_enqueue (
 				size++;
 			else if ((urb->transfer_flags & URB_ZERO_PACKET) != 0
 				&& (urb->transfer_buffer_length
-					% usb_maxpacket (urb->dev, pipe,
-						usb_pipeout (pipe))) == 0)
+					% usb_maxpacket(urb->dev, pipe)) == 0)
 				size++;
 			break;
 		case PIPE_ISOCHRONOUS: /* number of packets from URB */
diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index e82ff2a49672..aaedf55d3c62 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -1685,7 +1685,7 @@ static struct list_head *qh_urb_transaction(struct oxu_hcd *oxu,
 		token |= (1 /* "in" */ << 8);
 	/* else it's already initted to "out" pid (0 << 8) */
 
-	maxpacket = max_packet(usb_maxpacket(urb->dev, urb->pipe, !is_input));
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
@@ -1796,7 +1796,7 @@ static struct ehci_qh *qh_make(struct oxu_hcd *oxu,
 
 	is_input = usb_pipein(urb->pipe);
 	type = usb_pipetype(urb->pipe);
-	maxp = usb_maxpacket(urb->dev, urb->pipe, !is_input);
+	maxp = usb_maxpacket(urb->dev, urb->pipe);
 
 	/* Compute interrupt scheduling parameters just once, and save.
 	 * - allowing for high bandwidth, how many nsec/uframe are used?
diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 63719cdf6a4e..abb88dd40d4e 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -1867,8 +1867,7 @@ static struct r8a66597_td *r8a66597_make_td(struct r8a66597 *r8a66597,
 	td->pipe = hep->hcpriv;
 	td->urb = urb;
 	td->address = get_urb_to_r8a66597_addr(r8a66597, urb);
-	td->maxpacket = usb_maxpacket(urb->dev, urb->pipe,
-				      !usb_pipein(urb->pipe));
+	td->maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 	if (usb_pipecontrol(urb->pipe))
 		td->type = USB_PID_SETUP;
 	else if (usb_pipein(urb->pipe))
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 85623731a516..d206bd95c7bb 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -842,7 +842,7 @@ static int sl811h_urb_enqueue(
 		INIT_LIST_HEAD(&ep->schedule);
 		ep->udev = udev;
 		ep->epnum = epnum;
-		ep->maxpacket = usb_maxpacket(udev, urb->pipe, is_out);
+		ep->maxpacket = usb_maxpacket(udev, urb->pipe);
 		ep->defctrl = SL11H_HCTLMASK_ARM | SL11H_HCTLMASK_ENABLE;
 		usb_settoggle(udev, epnum, is_out, 0);
 
@@ -878,8 +878,8 @@ static int sl811h_urb_enqueue(
 			if (type == PIPE_ISOCHRONOUS)
 				ep->defctrl |= SL11H_HCTLMASK_ISOCH;
 			ep->load = usb_calc_bus_time(udev->speed, !is_out,
-				(type == PIPE_ISOCHRONOUS),
-				usb_maxpacket(udev, pipe, is_out))
+						     type == PIPE_ISOCHRONOUS,
+						     usb_maxpacket(udev, pipe))
 					/ 1000;
 			break;
 		}
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 79d571f1429b..76862ba40f35 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -825,8 +825,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
 	memset(ptd, 0, sizeof(*ptd));
 
 	/* according to 3.6.2, max packet len can not be > 0x400 */
-	maxpacket = usb_maxpacket(qtd->urb->dev, qtd->urb->pipe,
-						usb_pipeout(qtd->urb->pipe));
+	maxpacket = usb_maxpacket(qtd->urb->dev, qtd->urb->pipe);
 	multi =  1 + ((maxpacket >> 11) & 0x3);
 	maxpacket &= 0x7ff;
 
@@ -1768,7 +1767,6 @@ static void qtd_list_free(struct list_head *qtd_list)
  * Packetize urb->transfer_buffer into list of packets of size wMaxPacketSize.
  * Also calculate the PID type (SETUP/IN/OUT) for each packet.
  */
-#define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
 static void packetize_urb(struct usb_hcd *hcd,
 		struct urb *urb, struct list_head *head, gfp_t flags)
 {
@@ -1809,8 +1807,7 @@ static void packetize_urb(struct usb_hcd *hcd,
 			packet_type = IN_PID;
 	}
 
-	maxpacketsize = max_packet(usb_maxpacket(urb->dev, urb->pipe,
-						usb_pipeout(urb->pipe)));
+	maxpacketsize = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index 6c38c62d29b2..b2f980409d0b 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -1449,8 +1449,7 @@ wait:if (ftdi->disconnected > 0) {
 			command->length = 0x8007;
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 8;
 			command->value = 0;
 			command->buffer = urb->setup_packet;
@@ -1514,8 +1513,7 @@ wait:if (ftdi->disconnected > 0) {
 							    1);
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 0;
 			command->value = 0;
 			command->buffer = NULL;
@@ -1571,8 +1569,7 @@ wait:if (ftdi->disconnected > 0) {
 			command->length = 0x0000;
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 0;
 			command->value = 0;
 			command->buffer = NULL;
@@ -1634,8 +1631,7 @@ wait:if (ftdi->disconnected > 0) {
 			command->header = 0x81 | (ed << 5);
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = min_t(u32, 1024,
 						 urb->transfer_buffer_length -
 						 urb->actual_length);
@@ -1715,8 +1711,7 @@ wait:if (ftdi->disconnected > 0) {
 							    1);
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 0;
 			command->value = 0;
 			command->buffer = NULL;
diff --git a/drivers/usb/misc/lvstest.c b/drivers/usb/misc/lvstest.c
index f8686139d6f3..25ec5666a75e 100644
--- a/drivers/usb/misc/lvstest.c
+++ b/drivers/usb/misc/lvstest.c
@@ -437,7 +437,7 @@ static int lvs_rh_probe(struct usb_interface *intf,
 	INIT_WORK(&lvs->rh_work, lvs_rh_work);
 
 	pipe = usb_rcvintpipe(hdev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(hdev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(hdev, pipe);
 	usb_fill_int_urb(lvs->urb, hdev, pipe, &lvs->buffer[0], maxp,
 			lvs_rh_irq, lvs, endpoint->bInterval);
 
diff --git a/drivers/usb/storage/onetouch.c b/drivers/usb/storage/onetouch.c
index a989fe930e21..1db2eefeea22 100644
--- a/drivers/usb/storage/onetouch.c
+++ b/drivers/usb/storage/onetouch.c
@@ -180,7 +180,7 @@ static int onetouch_connect_input(struct us_data *ss)
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = min(maxp, ONETOUCH_PKT_LEN);
 
 	onetouch = kzalloc(sizeof(struct usb_onetouch), GFP_KERNEL);
diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 1928b3918242..64d96d210e02 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -363,7 +363,7 @@ static int usb_stor_intr_transfer(struct us_data *us, void *buf,
 	usb_stor_dbg(us, "xfer %u bytes\n", length);
 
 	/* calculate the max packet size */
-	maxp = usb_maxpacket(us->pusb_dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(us->pusb_dev, pipe);
 	if (maxp > length)
 		maxp = length;
 
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 200b7b79acb5..2ebab87bf867 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1969,30 +1969,11 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
 	return eps[usb_pipeendpoint(pipe)];
 }
 
-/*-------------------------------------------------------------------------*/
-
-static inline __u16
-usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
+static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)
 {
-	struct usb_host_endpoint	*ep;
-	unsigned			epnum = usb_pipeendpoint(pipe);
-
-	if (is_out) {
-		WARN_ON(usb_pipein(pipe));
-		ep = udev->ep_out[epnum];
-	} else {
-		WARN_ON(usb_pipeout(pipe));
-		ep = udev->ep_in[epnum];
-	}
-	if (!ep)
-		return 0;
-
-	/* NOTE:  only 0x07ff bits are for packet size... */
-	return usb_endpoint_maxp(&ep->desc);
+	return usb_endpoint_maxp(&usb_pipe_endpoint(dev, pipe)->desc);
 }
 
-/* ----------------------------------------------------------------------- */
-
 /* translate USB error codes to codes user space understands */
 static inline int usb_translate_errors(int error_code)
 {
diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index fdbdfb7bce92..6a4af725aedd 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -552,10 +552,10 @@ int line6_init_pcm(struct usb_line6 *line6,
 
 	line6pcm->max_packet_size_in =
 		usb_maxpacket(line6->usbdev,
-			usb_rcvisocpipe(line6->usbdev, ep_read), 0);
+			usb_rcvisocpipe(line6->usbdev, ep_read));
 	line6pcm->max_packet_size_out =
 		usb_maxpacket(line6->usbdev,
-			usb_sndisocpipe(line6->usbdev, ep_write), 1);
+			usb_sndisocpipe(line6->usbdev, ep_write));
 	if (!line6pcm->max_packet_size_in || !line6pcm->max_packet_size_out) {
 		dev_err(line6pcm->line6->ifcdev,
 			"cannot get proper max packet size\n");
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 2c01649c70f6..fba498f9e7dc 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1285,7 +1285,7 @@ static int snd_usbmidi_in_endpoint_create(struct snd_usb_midi *umidi,
 		pipe = usb_rcvintpipe(umidi->dev, ep_info->in_ep);
 	else
 		pipe = usb_rcvbulkpipe(umidi->dev, ep_info->in_ep);
-	length = usb_maxpacket(umidi->dev, pipe, 0);
+	length = usb_maxpacket(umidi->dev, pipe);
 	for (i = 0; i < INPUT_URBS; ++i) {
 		buffer = usb_alloc_coherent(umidi->dev, length, GFP_KERNEL,
 					    &ep->urbs[i]->transfer_dma);
@@ -1374,7 +1374,7 @@ static int snd_usbmidi_out_endpoint_create(struct snd_usb_midi *umidi,
 		pipe = usb_sndbulkpipe(umidi->dev, ep_info->out_ep);
 	switch (umidi->usb_id) {
 	default:
-		ep->max_transfer = usb_maxpacket(umidi->dev, pipe, 1);
+		ep->max_transfer = usb_maxpacket(umidi->dev, pipe);
 		break;
 		/*
 		 * Various chips declare a packet size larger than 4 bytes, but
diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 9d0e44793896..a4d32e8a1d36 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -51,7 +51,7 @@ static int init_pipe_urbs(struct usb_stream_kernel *sk,
 {
 	int u, p;
 	int maxpacket = use_packsize ?
-		use_packsize : usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+		use_packsize : usb_maxpacket(dev, pipe);
 	int transfer_length = maxpacket * sk->n_o_ps;
 
 	for (u = 0; u < USB_STREAM_NURBS;
@@ -171,7 +171,7 @@ struct usb_stream *usb_stream_new(struct usb_stream_kernel *sk,
 	out_pipe = usb_sndisocpipe(dev, out_endpoint);
 
 	max_packsize = use_packsize ?
-		use_packsize : usb_maxpacket(dev, in_pipe, 0);
+		use_packsize : usb_maxpacket(dev, in_pipe);
 
 	/*
 		t_period = period_frames / sample_rate
@@ -187,7 +187,7 @@ struct usb_stream *usb_stream_new(struct usb_stream_kernel *sk,
 	read_size += packets * USB_STREAM_URBDEPTH *
 		(max_packsize + sizeof(struct usb_stream_packet));
 
-	max_packsize = usb_maxpacket(dev, out_pipe, 1);
+	max_packsize = usb_maxpacket(dev, out_pipe);
 	write_size = max_packsize * packets * USB_STREAM_URBDEPTH;
 
 	if (read_size >= 256*PAGE_SIZE || write_size >= 256*PAGE_SIZE) {
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index cfc1ea53978d..9cd5e3aae4f7 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -421,7 +421,7 @@ static int usx2y_urbs_allocate(struct snd_usx2y_substream *subs)
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);
-	subs->maxpacksize = usb_maxpacket(dev, pipe, is_playback);
+	subs->maxpacksize = usb_maxpacket(dev, pipe);
 	if (!subs->maxpacksize)
 		return -EINVAL;
 
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index db83522c1b49..240349b644f3 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -321,7 +321,7 @@ static int usx2y_usbpcm_urbs_allocate(struct snd_usx2y_substream *subs)
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);
-	subs->maxpacksize = usb_maxpacket(dev, pipe, is_playback);
+	subs->maxpacksize = usb_maxpacket(dev, pipe);
 	if (!subs->maxpacksize)
 		return -EINVAL;
 
-- 
2.34.1

