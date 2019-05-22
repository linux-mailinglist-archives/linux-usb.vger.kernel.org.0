Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 712E326279
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 12:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbfEVKwT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 06:52:19 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56607 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729379AbfEVKwS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 May 2019 06:52:18 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D76382498A;
        Wed, 22 May 2019 06:52:16 -0400 (EDT)
Received: from imap6 ([10.202.2.56])
  by compute6.internal (MEProxy); Wed, 22 May 2019 06:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=PPq/8jE/qjEIx/IonXyXM0rB0PUsfcD
        ROA34oMYTMe0=; b=qRvwpq3SgLOT5hJGaFmf62oSiTnIPsOhTAmSYsOdkmfun+7
        TqL/2c/aPtCEr4DwES9rvsN5Xgaqc5BaROPFjoGoLLdxO3dFibqfOtCz73OSVlIV
        oV4wsBEhyHNzpFNIygX+3aW0BGIFxuH9djrENiKA1j637jmi2BSF5FfJd5w1WGFj
        AdFPGnOzqCDT95WrCFbKYM2SouTjzR5zJJcABq+eYU8J06WDUd3CJpROddiVXBNJ
        XjnrQLY6s44KeEMArc4WX0HwTBI79yHT29wL2jImaxhtf9uZyX9Svorq0b8QWvab
        OWqcAIyr29r703Ho1eODgZ6KKkxjuwXHtvU6jSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PPq/8j
        E/qjEIx/IonXyXM0rB0PUsfcDROA34oMYTMe0=; b=NCGqiseGw7/YGpSX8NOtj5
        6x9KtsxH3S5SFtzaIwvExII7nlISS+OXhhsgPU7YpYijF/opA+gK3cQ8I1RapbfP
        t/alr7FTTUrblgFjPiyDdzfyBa++mWeR1oD5u3cc2CZwVNtr9iK9vRsFUJ1Pd9bp
        R1Nndymna8Xof0kVskJhCksXBR7hPlvG/5QxczhCdaE5rCCXambi/HxbXKW/nZEU
        NHCilfcB2pKSDrSHpaQvhCi9R+YBzr+MtJg6uH0bzbR1XQxYYayKMBUSrSzAVod6
        3ORwkSBZAneSLSyPja+gly+/PDuzvDd0C51hue8yKOQM6SaqL3WrsQDqeGc8eH8Q
        ==
X-ME-Sender: <xms:4CnlXBDBDvxaayndbouHCzJNdKrqNEx2uEX9KmZuXgzWqpDJX1GzOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetuggr
    mhcuifgruhhsmhgrnhhnfdcuoegrghgruhhsmhgrnhhnsehfrghsthhmrghilhdrtghomh
    eqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfrrghrrghmpehmrghilhhfrhho
    mheprghgrghushhmrghnnhesfhgrshhtmhgrihhlrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptd
X-ME-Proxy: <xmx:4CnlXD-iWcINzWnfb0Jcegxybr-sCl4HmkgquQGnsukFNC_LPA3yBw>
    <xmx:4CnlXH7DO1gJ2v8HpvPEdCi5DE-uwYioMNc20vNO9Lv9_iYuM2gMwQ>
    <xmx:4CnlXJEc4qGzcmLeGtx0x5hxyKdaACGPovacbMyQmfnK3gTdlFCw3w>
    <xmx:4CnlXBzjqtFeKffA-Pvf7g7MbpwQnX9S9tndmxqr8HluQeKuj_8XFw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5B5E61400A0; Wed, 22 May 2019 06:52:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-550-g29afa21-fmstable-20190520v1
Mime-Version: 1.0
Message-Id: <6017fa4a-5b29-4c54-ada7-274dcefbaac7@www.fastmail.com>
In-Reply-To: <20190522055135.GB13702@kroah.com>
References: <1b819641-609b-4e0e-86a3-afe81eb73efc@www.fastmail.com>
 <20190522055135.GB13702@kroah.com>
Date:   Wed, 22 May 2019 05:54:20 -0500
From:   "Adam Gausmann" <agausmann@fastmail.com>
To:     "Greg KH" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?Re:_Raven_Ridge_xhci=5Fhcd_not_working:_"Refused_to_change_pow?=
 =?UTF-8?Q?er_state,_currently_in_D3"?=
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 22, 2019, at 00:51, Greg KH wrote:
> On Tue, May 21, 2019 at 04:49:14PM -0500, Adam Gausmann wrote:
> > On my ThinkPad E585, with a Ryzen 5 2500U, my XHCI driver crashes when plugging in a device after switching power states, or during switching itself.
> > 
> > Steps to Reproduce: 
> > 
> > - Unplug the AC power, or start the computer with AC unplugged. If the computer has AC power at boot, it will work properly, but plugging it in after running unplugged will not.
> > 
> > The xhci_hcd and xhci_pci modules remain loaded after the error. Reloading them appears to reset it, and the scenarios above still apply as if the computer was just started.
> > 
> > These tests were performed with laptop_mode disabled; enabling it alters the behavior. I will test that more later.
> > 
> > Results:
> > 
> > The USB device fails to register, and `lsusb` remains unchanged. No other errors will appear after the first one occurs.
> > One of two error messages will appear in kernel logs:
> > 
> > [   51.276650] xhci_hcd 0000:05:00.4: Refused to change power state, currently in D3
> > [   51.276658] xhci_hcd 0000:05:00.3: Refused to change power state, currently in D3
> > [   51.277051] xhci_hcd 0000:05:00.3: enabling device (0000 -> 0002)
> > [   51.277074] xhci_hcd 0000:05:00.3: WARN: xHC restore state timeout
> > [   51.277077] xhci_hcd 0000:05:00.3: PCI post-resume error -110!
> > [   51.279316] xhci_hcd 0000:05:00.3: HC died; cleaning up
> > [   51.288669] xhci_hcd 0000:05:00.4: enabling device (0000 -> 0002)
> > 
> > [ 5258.438021] xhci_hcd 0000:05:00.3: Refused to change power state, currently in D3
> > [ 5258.438328] xhci_hcd 0000:05:00.4: Refused to change power state, currently in D3
> > [ 5258.450026] xhci_hcd 0000:05:00.3: enabling device (0000 -> 0002)
> > [ 5258.450511] xhci_hcd 0000:05:00.4: enabling device (0000 -> 0002)
> > [ 5266.112941] xhci_hcd 0000:05:00.3: Error while assigning device slot ID
> > [ 5266.112952] xhci_hcd 0000:05:00.3: Max number of devices this xHCI host supports is 64.
> > [ 5266.112963] usb usb1-port2: couldn't allocate usb_device
> > [ 5280.960968] xhci_hcd 0000:05:00.3: Error while assigning device slot ID
> > [ 5280.960979] xhci_hcd 0000:05:00.3: Max number of devices this xHCI host supports is 64.
> > [ 5280.960993] usb usb1-port2: couldn't allocate usb_device
> > 
> > Expected results: 
> > 
> > Device connects, powers on, and registers properly, showing up in `lsusb`.
> > 
> > Build: 
> > 
> > Linux 4.19.44_1 #1 SMP PREEMPT Wed Mar 27 20:41:38 UTC 2019 x86_64 GNU/Linux, with firmware 20181218
> 
> 4.19 is pretty old for xhci and normal desktop systems.  Can you please
> try 5.1 and see if that resolves the issue or not?
> 
> thanks,
> 
> greg k-h
>

Hi Greg, thanks for your feedback.

I've just tested this on 5.1.3_1 with the same results as before. I should also note that I am using the kernel and firmware as packaged by Void Linux, and these appear to be the latest available from them.  Should I try the latest firmware release from git.kernel.org as well?

-- 
  Adam Gausmann
  agausmann@fastmail.com
