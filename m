Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0538C233895
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 20:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbgG3Svz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 14:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgG3Svy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 14:51:54 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1360BC061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 11:51:54 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id l17so29288597iok.7
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 11:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OCqeDwHPhUrXIwkl+u3S8UHnT5nW41C1+PlGy1m1O7c=;
        b=gT7558YHs3n8avYUa2Wxr4MuqjxGT/5O4AleyLF+tXawLja5yl7FWXKkk4pbi0tg2s
         jcZjVKDNtkl0mDG0QSAKM5rRD6jGLvFeCvkOrvVayU6TZ+cBb0P57llrK+N0772p9pmE
         l7Sfqoqvb1IFLlhjWXSRwA52krZUmd8GMVKciJ1pQDanj+t9VkznmsHcCF9S8zhPih7z
         saRWTatxRuuNCDc2oFJMyzGu0QIzH36NKaythLayZUiNyXeX87qXMrPTFGQRl157ue4u
         lhIv7l3wRSnNsi+r3XKM6FraY6VQWioKz2ozxh7eVZX6udL0WbZPoQt/c8yB79oxyCO9
         1VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OCqeDwHPhUrXIwkl+u3S8UHnT5nW41C1+PlGy1m1O7c=;
        b=nBvH/SCAIdEH6pMlZkzrTtH/ll+QarICXTUYAcSAoavjhBkSz3E6cyGv0dif1ykoeI
         CAUGqMx5NBrDr04tghJpsPQAUO+i7pOm2Dkj332sUxvP0sgCxEE2i2yWIXiTx3jHFiWP
         KDmJoM89GugCfd2e2+eyXpxcZzxSnuIjn4+eAkjYeERgWN9jcT8p67kv4VAX3MYS0R6z
         eozsZcsZ1ZQOtzoQpTdt6UgZTs9Q4PVHy6c3DxRKDXg/fyByyYrh5Yz09Tp2RTrcXlRV
         nH1AZZIAS3SlycRxC1hSnOlASBeaDD1o55sXRUvVjvFbzi9uM2a60bCRt3U1xIZRezBy
         49tA==
X-Gm-Message-State: AOAM530tM6MT9NkIY7UXAUBFmisLsUAsGrCfoPNn6EO9zKZkvPFRV/3n
        lOoM7Xw/5lxHMLOgF6stu+G6rO6aGwg=
X-Google-Smtp-Source: ABdhPJyBlzgXC9z3g9PS9m3ju4CUwwl3C99xEsgArIx1EmMJhFcs9YS+CjPD+PNCiN74rDEDKwCgJg==
X-Received: by 2002:a6b:be81:: with SMTP id o123mr26139287iof.64.1596135113383;
        Thu, 30 Jul 2020 11:51:53 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id q70sm3513407ili.49.2020.07.30.11.51.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 11:51:52 -0700 (PDT)
Date:   Thu, 30 Jul 2020 14:51:50 -0400
From:   Trevor Woerner <twoerner@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     jamesg@zaltys.org, linux-usb@vger.kernel.org
Subject: Re: lpc32xx and stotg04
Message-ID: <20200730185150.GA1419@linux-uys3>
References: <20200723212743.GA11107@linux-uys3>
 <20200729172829.GA3679@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200729172829.GA3679@piout.net>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexandre,

I so greatly appreciate your thoughts on this!

On Wed 2020-07-29 @ 07:28:29 PM, Alexandre Belloni wrote:
> Hi,
> 
> On 23/07/2020 17:27:43-0400, Trevor Woerner wrote:
> > I too am working with a board that uses the lpc32xx SoC (the lpc3240, to be
> > specific) and has a stotg04 for the USB transceiver instead of the isp1301.
> > 
> > I can't get the USB to work.
> > 
> > My guess is that I don't have the device tree correct.
> > 
> > I could embarrass myself by showing you what combinations I've tried but I
> > thought maybe I'd ask and see if either of you could provide a DT snippet
> > describing how to hook up the stotg04 to the i2cusb. Admittedly I'm quite
> > fuzzy when it comes to device trees.
> > 
> 
> This is what I had that is relevant:
> 
> &i2cusb {
> 	clock-frequency = <100000>;
> 
> 	isp1301: usb-transceiver@2d {
> 		compatible = "nxp,isp1301";
> 		reg = <0x2d>;
> 	};
> };
> 
> /* Here, choose exactly one from: ohci, usbd */
> &usbd {
> // &ohci {
> 	transceiver = <&isp1301>;
> 	status = "okay";
> };

It looks like my DTS is correct after all.

> > I'm also a bit fuzzy on USB. I want to plug usb sticks into my device (which,
> > by my understanding, is the opposite of OTG). So additionally I want to enable
> > ohci and not usbd?
> > 
> 
> Indeed, you want ohci (as you can see this is commented out in my device
> tree)
> 
> > In one DT incantation (the one showing the most promise so far) on startup
> > 'lsusb' shows two usb devices. The moment I plug a USB drive into my device I
> > get:
> > 
> > 	[  433.268009] usb-ohci 31020000.ohci: controller won't resume
> > 	[  433.273603] usb-ohci 31020000.ohci: HC died; cleaning up
> > 	[  433.280566] usb 1-1: USB disconnect, device number 2
> > 
> > And afterwards only one device is listed by 'lsusb'.
> > 
> > Currently I'm using a 5.0 kernel and a 5.4 kernel, but I could use any kernel
> > (upstream, ideally). In either case, it doesn't seem possible to deselect the
> > isp1301 from the kernel config? It gets selected automatically. If I'm using
> > the stotg04 instead of the isp1301, do I need a way to turn off the isp1301?
> > 
> 
> The platform I was working on is on v5.1 and has an stotg04. Honnestly,
> the whole thing is a mess and you have to use the isp1301 driver. Then
> the difference between isp1301 and stotg04 is handled in lpc32xx_udc.c.
> 
> So I would say you are missing something similar to what I did in
> 2a60f5eafa74 ("usb: gadget: udc: lpc32xx: add support for stotg04 phy")
> but in drivers/usb/host/ohci-nxp.c:isp1301_configure_lpc32xx()
> 
> I guess your issue is MC2_SPD_SUSP_CTRL line 75 ;) You can try to
> remove it.

Thank you very much for your insights and clarifications! Your patch will be
very useful to me.

Best regards,
	Trevor
