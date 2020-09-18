Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B83226F49C
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 05:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIRDP5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 23:15:57 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45331 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726308AbgIRDP4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 23:15:56 -0400
X-Greylist: delayed 449 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 23:15:55 EDT
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 527235C0227;
        Thu, 17 Sep 2020 23:08:26 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Thu, 17 Sep 2020 23:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=N0fBPqFZS8Mrp/r3AD01EkomJdINfUl
        upJEQIycVgKA=; b=Qzpsb3EkF08Y+bnMVydaCQ6dAi/T4cgJQ4dhjHWGjZPD/hY
        iVJoxrDLnXXl2z2YCcVBwxoRLj58kjhUXmMDDKDUEpaWwcyxGe3Jkg9W0240IGXK
        +GTrIKBfkRTZJNk3PBfsrTqUpv6CIhhjbalD2+5RNRvme+uQGAR6iax0EOP+1/g+
        J0GFGMw7yaUGeWweszUJFdEW+wUYO8KaboUJlzxS8nZFMiqmR/TKD9/+bl4LrGBs
        jAAAmA7EhGu42SFWL01w5JVU8gY2xRD/Rs4LqpywK0A4+ci2ek0E1bhxVWY0vUOO
        7wZPHLgY0pgCgYMuybllXUMyVRQZJSdQOdbW0mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N0fBPq
        FZS8Mrp/r3AD01EkomJdINfUlupJEQIycVgKA=; b=FXTt/hzCEFG4FaxubkEc5r
        ufAkBMXeKneL6JnTpixaX84TNqYHj55kQoG/nUD2+47YMuexpgoXshAvc36o8H1w
        bNiRigPasJ0YzOF9bDOzdyWLm8m/YHdV3yUBC0tmYWB52TzjZp2p01+Ewv8uiFJ+
        KXdDcnRaS7XiyNCSm+Y0jqGOKjD19r7TuKS/bhQ4CiDCDW+HXfpdZBpXeAs3ICJP
        YetAyHvPK8WZ0/fIM6rY8cnkPlud0j0F/mShwYnlS2G6ksliEAHhbgktKIxJVPBk
        6TTnV2tUAZ7mrXG2sk4jRgmL41EXOSXdD6D8KA97L7iVzL34WT0sMguJxmFelqQQ
        ==
X-ME-Sender: <xms:qSRkX1FEeOU-GmWGwU5LY2BysL4IPJHrUQJKpW6cI4pJVqgvlqvejA>
    <xme:qSRkX6X4N0ItVWXT_D2wdqBlE2V8omdxvfaeKOT06H9QgqdRvzMwo5KY8btWlVeo2
    b2x6S3R_JfRPRkAs4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhusheq
    necuggftrfgrthhtvghrnhepheevhfetffekhfekieejfefgvddtvdeiteetkeelvedvud
    ffheelieekvdevtedunecuffhomhgrihhnpehngihprdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:qSRkX3J0tcDauvctDPH0mw88p2NOOB5ygoE2SCRQCZ7RNrtSP3hoCA>
    <xmx:qSRkX7Fs3I0g4R4ABRRdw9M8d-1190UrSi8eoBOO_Zn1vR2vDBWkhA>
    <xmx:qSRkX7UR8V007fLc5Ih5XTzBURGobu3JJ8TvAjphfIbR9Y3DjUH4YQ>
    <xmx:qiRkXyC7QicWwJuHjm2TXK3a0x8umefTCI_2Bj-rshz5fN9B4Q2gwg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8A5BA660069; Thu, 17 Sep 2020 23:08:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <63692cc0-4df0-41d7-8889-a83eca7fd806@www.fastmail.com>
In-Reply-To: <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
 <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
Date:   Thu, 17 Sep 2020 22:08:04 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Ran Wang" <ran.wang_1@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Enabling Device DWC3 Device Mode
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Ran. I took a look at the document, if you or anyone else can weigh in
I'd appreciate it. The platform devices seem to be active, see below.

On Thu, Sep 17, 2020, at 8:11 PM, Ran Wang wrote:
> Hi Sid,
> 
> > -----Original Message-----
> > From: Sid Spry <sid@aeam.us>
> > Sent: Friday, September 18, 2020 7:55 AM
> > To: linux-usb@vger.kernel.org
> > Subject: Enabling Device DWC3 Device Mode
> > 
> > I've a RK3399 based board (RockPro64) and am unable to find any useful
> > information on how to ensure the USB controller is set up for device/gadget
> > operation.
> > 
> > The base armbian (Ubuntu Focal based distribution) kernel did not have
> > dwc2/dwc3 modules compiled. I compiled the modules for kernel ~5.7 after
> > ensuring that dual role mode was supported along with gadget configfs and
> > am able to modprobe them, but I see no devices populate in /sys/class/udc
> > and no dmesg errors.
> > 
> > I should be able to target any kernel version, but I am concerned that there
> > may be missing device tree information but am unsure how to check that.
> > Most people seem uninterested in using the device mode on this hardware,
> > but it was 1 of 2 boards, based on the same part, that I found claiming to
> > support device mode USB3.
> 
> For DWC3 device mode support, maybe you could check Layerscape platforms
> as a reference. There is a doc which has details on how-to: 
> https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev20.04.pdf
> search 'Gadget driver' .
> 

Thanks for the pointer. Around line 771 is what I expected to see for my board.
However, in arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi (I have the v2
board) the USB related entries I see are:

&usbdrd3_0 {
        status = "okay";
};

&usbdrd_dwc3_0 {
        status = "okay";
        dr_mode = "otg";
};

&usbdrd3_1 {
        status = "okay";
};

&usbdrd_dwc3_1 {
        status = "okay";
        dr_mode = "host";
};

Starting at line 767. It's a lot sparser, but the dr_mode is there. I feel I should
note that despite the lack of devices in /sys/class/udc I have nodes in
/sys/bus/platform/drivers/dwc3:

# ls /sys/bus/platform/drivers/dwc3
bind  fe800000.usb  fe900000.usb  module  uevent  unbind

> One of the example in DTS is arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> and arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts, and you need to manually
> update it by following above doc to enable device mode.
> 

The document linked is relevant beginning page 445. The above dts settings
seem appropriate and I have the necessary kernel configuration enabled. Any
relevant drivers are modules.

I'm not really sure how to diagnose it from here. Any help is appreciated.

Thanks in advance!
