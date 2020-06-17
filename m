Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55ED1FC3F4
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 04:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgFQCDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 22:03:15 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:22389 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFQCDO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jun 2020 22:03:14 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200617020309epoutp0478e34b4344d0822b4d5c1c384b94f01b~ZMm2OtX601430314303epoutp04g
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2020 02:03:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200617020309epoutp0478e34b4344d0822b4d5c1c384b94f01b~ZMm2OtX601430314303epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1592359389;
        bh=XN4zHQ5s2L7w5R9LO9A/kCj0MXyiPg2YWme+Zkr0eyE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=IDm3PHN7sy5hiGMIyEhyCgzZtwFMsMg/1zGclsKdTfQMwpvcZVBPWeN3FseHnBzw7
         QC3UnaZ8GmugAg+xEDMNhbTzoKjBatIK84jOq7qlaz9l+3aLHblggJVnXBUIn+YaLP
         7kstEpokDIqshIHj302cCx0wG94yhWyfc6AI7ztk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20200617020309epcas2p2bdd4bab8d1e53e50b671b792e3bf11cb~ZMm14MyJ_0461304613epcas2p20;
        Wed, 17 Jun 2020 02:03:09 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.184]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 49mpHt1MSXzMqYkk; Wed, 17 Jun
        2020 02:03:06 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        59.C1.18874.AD979EE5; Wed, 17 Jun 2020 11:03:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791~ZMmy3eyvH2950429504epcas2p3W;
        Wed, 17 Jun 2020 02:03:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200617020305epsmtrp1454902663a7061d4aa567eca824d37e7~ZMmy2wrKh0084200842epsmtrp1T;
        Wed, 17 Jun 2020 02:03:05 +0000 (GMT)
X-AuditID: b6c32a46-503ff700000049ba-08-5ee979da6f76
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D5.8B.08303.9D979EE5; Wed, 17 Jun 2020 11:03:05 +0900 (KST)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.36.155.120]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200617020305epsmtip2ad58327355439dbab200ee242dac8876~ZMmyu1dty2357023570epsmtip2S;
        Wed, 17 Jun 2020 02:03:05 +0000 (GMT)
From:   JaeHun Jung <jh0801.jung@samsung.com>
To:     linux-usb@vger.kernel.org
Cc:     JaeHun Jung <jh0801.jung@samsung.com>
Subject: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
Date:   Wed, 17 Jun 2020 10:55:30 +0900
Message-Id: <1592358930-28684-1-git-send-email-jh0801.jung@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7bCmue6typdxBj1T2CzuPvzBYrFoWSuz
        A5NH35ZVjB6fN8kFMEXl2GSkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qba
        Krn4BOi6ZeYAjVdSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFBgaFugVJ+YWl+al
        6yXn51oZGhgYmQJVJuRkbJ0xi7mgyb7i9cdV7A2MU026GDk5JARMJBZ+vs/cxcjFISSwg1Hi
        wedHTBDOJ0aJtn2b2ECqhAQ+M0rM6RGE6fj2dS47RHwXo8SJbcIQDT8YJVZPP8wKkmAT0JbY
        N2cRWJGIgKzE4Su/mUFsZgFNic/fvgJt4OAQFnCRmHVTGCTMIqAqsW3tb7BWXgF3iT37jzFC
        7JKTuHmuE+w6CYHPbBIf3+5ggUi4SHx70MUKYQtLvDq+hR3ClpJ42d8GZddLnN64Dqq5h1Hi
        441dbBAJY4lZz9oZQY4AOWj9Ln0QU0JAWeLILRaIM/kkOg7/ZYcI80p0tAlBNKpKHGy8CXWB
        tMS33ndQZ3pI7J/zEaxcSCBW4vCqmAmMsrMQxi9gZFzFKJZaUJybnlpsVGCEHEObGMHpRctt
        B+OUtx/0DjEycTAeYpTgYFYS4XX+/SJOiDclsbIqtSg/vqg0J7X4EKMpMLgmMkuJJucDE1xe
        SbyhqZGZmYGlqYWpmZGFkjhvveKFOCGB9MSS1OzU1ILUIpg+Jg5OqQamag9hnpgb8y+//+c6
        +8Qyq9Lrd+K7PqoyTp6zV3hKq+qB1TE3xPUnp5aFRlX4rC+0Lddb2u8h4fJZorsuxfIq74mT
        /zrCxZr0crQ8Xz9y859UKaq/SWfhexm90Le/Qj7O5ux68Wf3yoB3C1vvaWu/X7tb8FGXyNYn
        Kne3zI4+liPhpcK+9dav1qf29lIVk0Rtm/v6a7Km7XVewSeuHmekVL0j+Hjt+eXNR9ZJHur9
        t2sf733hXYVrT4ZoXLd3TbiYF/ztmsTUkr6msLlHSif+P6wzLf+wdtvUXzIh7IIiPmr8zl2f
        bPPCSnn2NRTdzmtryPF5x9XXfup2mWfahaduh1sPdHNMUfhg6q+yOVmJpTgj0VCLuag4EQAS
        P1w5uAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGJMWRmVeSWpSXmKPExsWy7bCSvO7NypdxBs8fa1ncffiDxWLRslZm
        ByaPvi2rGD0+b5ILYIrisklJzcksSy3St0vgytg6YxZzQZN9xeuPq9gbGKeadDFyckgImEh8
        +zqXvYuRi0NIYAejxOllDWwQCWmJnZ1TmSBsYYn7LUdYIYq+MUr0nz7CApJgE9CW2DdnETuI
        LSIgK3H4ym9mEJtZQFPi87evQM0cHMICLhKzbgqDhFkEVCW2rf3NCmLzCrhL7Nl/jBFivpzE
        zXOdzBMYeRYwMqxilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAj2upbWDsY9qz7oHWJk
        4mA8xCjBwawkwuv8+0WcEG9KYmVValF+fFFpTmrxIUZpDhYlcd6vsxbGCQmkJ5akZqemFqQW
        wWSZODilGpg4zosras+p8kqeJGvrErOm++wjl+WPsgy042SeV6Q08Lk/5Fef8e79rB+V2+u8
        C7dXL/t93SvyZcfMw/vYfmTmHRV8ebVQ7VZWwO759xqEF8l/FDnWdSGr+fDrdSwLAtTKXSc9
        WfzV1WuG8sqE+s7XKQ+P7C3yF8mKb5dS9lz/pyqzdL/5e39Vg/+K/s8+iq9lq68z5nRJ2NLV
        3d5f9vzAJvsLG+c/e8LuFvXB95H9jOQzL1f3H+S/P+nwyeXmVaIJMqtmRJz+lpq0xf1Pl02c
        pWn7mZI4uxytgKplmQr3/d5ufBBZmvV6ft83q0dHdzQURzqH8sqkSfhG7uG0ElviNfdusG2g
        ynzzvZVn8pVYijMSDbWYi4oTAVT9+dppAgAA
X-CMS-MailID: 20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791
References: <CGME20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791@epcas2p3.samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In mobile, a co-processor is used when using USB audio
to improve power consumption.
hooking is required for sync-up when operating
the co-processor. So register call-back function.
The main operation of the call-back function is as follows:
- Initialize the co-processor by transmitting data
  when initializing.
- Change the co-processor setting value through
  the interface function.
- Configure sampling rate
- pcm open/close

Bug: 156315379

Change-Id: I32e1dd408e64aaef68ee06c480c4b4d4c95546dc
Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
---
 sound/usb/card.c     | 16 ++++++++++++++++
 sound/usb/card.h     |  1 +
 sound/usb/clock.c    |  5 +++++
 sound/usb/pcm.c      | 33 +++++++++++++++++++++++++++++++++
 sound/usb/usbaudio.h | 30 ++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fd6fd17..2f3fa14 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -111,6 +111,7 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
 static DEFINE_MUTEX(register_mutex);
 static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
 static struct usb_driver usb_audio_driver;
+struct snd_usb_audio_vendor_ops *usb_audio_ops;
 
 /*
  * disconnect streams
@@ -210,6 +211,12 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
 	return 0;
 }
 
+void snd_set_vender_interface(struct snd_usb_audio_vendor_ops *vendor_ops)
+{
+	usb_audio_ops = vendor_ops;
+}
+EXPORT_SYMBOL_GPL(snd_set_vender_interface);
+
 /*
  * parse audio control descriptor and create pcm/midi streams
  */
@@ -598,6 +605,9 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (err < 0)
 		return err;
 
+	if (usb_audio_ops && usb_audio_ops->vendor_conn)
+		usb_audio_ops->vendor_conn(intf, dev);
+
 	/*
 	 * found a config.  now register to ALSA
 	 */
@@ -653,6 +663,9 @@ static int usb_audio_probe(struct usb_interface *intf,
 	}
 	dev_set_drvdata(&dev->dev, chip);
 
+	if (usb_audio_ops && usb_audio_ops->vendor_usb_add_ctls)
+		usb_audio_ops->vendor_usb_add_ctls(chip, 0);
+
 	/*
 	 * For devices with more than one control interface, we assume the
 	 * first contains the audio controls. We might need a more specific
@@ -737,6 +750,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 
 	card = chip->card;
 
+	if (usb_audio_ops && usb_audio_ops->vendor_disc)
+		usb_audio_ops->vendor_disc();
+
 	mutex_lock(&register_mutex);
 	if (atomic_inc_return(&chip->shutdown) == 1) {
 		struct snd_usb_stream *as;
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 395403a..a55bb4c 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -175,5 +175,6 @@ struct snd_usb_stream {
 	struct snd_usb_substream substream[2];
 	struct list_head list;
 };
+void snd_set_vender_interface(struct snd_usb_audio_vendor_ops *vendor_ops);
 
 #endif /* __USBAUDIO_CARD_H */
diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index b118cf9..0ceeccb 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -642,8 +642,13 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	 * interface is active. */
 	if (rate != prev_rate) {
 		usb_set_interface(dev, iface, 0);
+		if (usb_audio_ops && usb_audio_ops->vendor_set_intf)
+			usb_audio_ops->vendor_set_intf(dev, alts, iface, 0);
 		snd_usb_set_interface_quirk(dev);
 		usb_set_interface(dev, iface, fmt->altsetting);
+		if (usb_audio_ops && usb_audio_ops->vendor_set_intf)
+			usb_audio_ops->vendor_set_intf(dev, alts, iface,
+					fmt->altsetting);
 		snd_usb_set_interface_quirk(dev);
 	}
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index a4e4064..6cdacac 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -134,6 +134,9 @@ static struct audioformat *find_format(struct snd_usb_substream *subs)
 			found = fp;
 			cur_attr = attr;
 		}
+
+		if (usb_audio_ops && usb_audio_ops->vendor_pcm_binterval)
+			usb_audio_ops->vendor_pcm_binterval(fp, found, &cur_attr, &attr);
 	}
 	return found;
 }
@@ -568,6 +571,9 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 		}
 		dev_dbg(&dev->dev, "setting usb interface %d:%d\n",
 			fmt->iface, fmt->altsetting);
+		if (usb_audio_ops && usb_audio_ops->vendor_set_pcm_intf)
+			usb_audio_ops->vendor_set_pcm_intf(dev, fmt->iface,
+					fmt->altsetting, subs->direction);
 		snd_usb_set_interface_quirk(dev);
 	}
 
@@ -891,6 +897,15 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	struct usb_interface *iface;
 	int ret;
 
+	if (usb_audio_ops && usb_audio_ops->vendor_set_pcmbuf) {
+		ret = usb_audio_ops->vendor_set_pcmbuf(subs->dev);
+
+		if (ret < 0) {
+			dev_err(&subs->dev->dev, "pcm buf transfer failed\n");
+			return ret;
+		}
+	}
+
 	if (! subs->cur_audiofmt) {
 		dev_err(&subs->dev->dev, "no format is specified!\n");
 		return -ENXIO;
@@ -924,6 +939,15 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 		if (ret < 0)
 			goto unlock;
 
+		if (usb_audio_ops && usb_audio_ops->vendor_set_rate) {
+			subs->need_setup_ep = false;
+			usb_audio_ops->vendor_set_rate(
+					subs->cur_audiofmt->iface,
+					subs->cur_rate,
+					subs->cur_audiofmt->altsetting);
+			goto unlock;
+		}
+
 		ret = configure_endpoint(subs);
 		if (ret < 0)
 			goto unlock;
@@ -1333,6 +1357,9 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_usb_substream *subs = &as->substream[direction];
 	int ret;
 
+	if (usb_audio_ops && usb_audio_ops->vendor_pcm_con)
+		usb_audio_ops->vendor_pcm_con(true, direction);
+
 	subs->interface = -1;
 	subs->altset_idx = 0;
 	runtime->hw = snd_usb_hardware;
@@ -1361,12 +1388,18 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 	struct snd_usb_substream *subs = &as->substream[direction];
 	int ret;
 
+	if (usb_audio_ops && usb_audio_ops->vendor_pcm_con)
+		usb_audio_ops->vendor_pcm_con(false, direction);
+
 	snd_media_stop_pipeline(subs);
 
 	if (!as->chip->keep_iface &&
 	    subs->interface >= 0 &&
 	    !snd_usb_lock_shutdown(subs->stream->chip)) {
 		usb_set_interface(subs->dev, subs->interface, 0);
+		if (usb_audio_ops && usb_audio_ops->vendor_set_pcm_intf)
+			usb_audio_ops->vendor_set_pcm_intf(subs->dev,
+					subs->interface, 0, direction);
 		subs->interface = -1;
 		ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D1);
 		snd_usb_unlock_shutdown(subs->stream->chip);
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 1c892c7..a2fd8a4 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -124,4 +124,34 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip);
 extern bool snd_usb_use_vmalloc;
 extern bool snd_usb_skip_validation;
 
+/* for vender function mapping */
+extern struct snd_usb_audio_vendor_ops *usb_audio_ops;
+
+/* USB audio interface function for audio core */
+struct snd_usb_audio_vendor_ops {
+	/* Set descriptors and memory map */
+	void (*vendor_conn)(struct usb_interface *intf,
+			struct usb_device *udev);
+	/* Set disconnection */
+	void (*vendor_disc)(void);
+	/* Set interface info and setting value */
+	int (*vendor_set_intf)(struct usb_device *udev,
+			struct usb_host_interface *alts, int iface, int alt);
+	/* Set sample rate */
+	int (*vendor_set_rate)(int iface, int rate, int alt);
+	/* Alloc pcm buffer */
+	int (*vendor_set_pcmbuf)(struct usb_device *udev);
+	/* Set pcm interface */
+	int (*vendor_set_pcm_intf)(struct usb_device *udev,
+			int iface, int alt, int direction);
+	/* informed whether pcm open/close to vendor */
+	void (*vendor_pcm_con)(int onoff, int direction);
+	/* set datainterval */
+	void (*vendor_pcm_binterval)(void *fp, void *found,
+			int *cur_attr, int *attr);
+	/* control USB F/W */
+	int (*vendor_usb_add_ctls)(struct snd_usb_audio *chip,
+				unsigned long private_value);
+};
+
 #endif /* __USBAUDIO_H */
-- 
2.7.4

