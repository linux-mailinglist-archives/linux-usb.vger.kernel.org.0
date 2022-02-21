Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45274BE1FE
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 18:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358105AbiBUMih (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 07:38:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358076AbiBUMig (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 07:38:36 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369F31928B
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 04:38:12 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d3so11186822wrf.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 04:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LKx7tTbFFTJnPN+u30WrvTluvsJNKvcCbVga5G4cng4=;
        b=euLhhZZCAI7A/+S/XKiME2KJm3o1oTmFVCPDGgzFxPD2ZbJ1lTYg7afyyVyL3gRe98
         idxSTePdGLX9d7sOwTHhzwAEWxOh9vHhERxV3oXp6U/pHUot27L8awxSYKn43JgEk9VO
         xMoaXpKHXp/XPZDkz7aGntl2MjCvslMxkER2B5OVMkqBxRsO+tvKorJ/2YRTj2go2DYy
         Ao/Jv886fKTdXfeFsccbc2ocJU51YG/+RctufqIhNMKqdkpkTjGfiMa+jJ0BPchvN3Zp
         6ed29r/PqxTv4NtEV3O9aeq+xkTgM2hKtwH9kJX+P4Ib7K6K0TjwFSUIuLcUh4EPHgM4
         gYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LKx7tTbFFTJnPN+u30WrvTluvsJNKvcCbVga5G4cng4=;
        b=7Dy4y1z0EP9+0bateTpnDciTqSpp2edp/t+IySjQ+nrSGEffWaHySGFsswVamdfxY7
         UpiMjWrq7F+1p82J07F2ox/dYHWVyyHMCOrYFU0VwqxH4HowO5AqL+SYjBEIw+vIu7IZ
         fVKsaQYGMWaczuwYzYOq6MllAw5DhoyPQgONYfCTdYDH/Lw9JMJXe1VKgGDtNsJiOGYn
         rmmCTq1/eis+GsvIFD6cm5YGOTI8i4CIGEKcRVFm3bBcJG+dLL+g0M843VHgn9PqWWe9
         VfuOL5O79xfN1x5D4L1WvR6vE2ylJFEyQX704aWDNZ85gxEW1mb+dZx+OOQgw6JvSEQg
         sPAw==
X-Gm-Message-State: AOAM53224zutYPE/N2t9UG9sPUS7s9SRwDXrdI8ZI+4suRDH0qwInGtn
        +djkPw+Gf7TDrc+TrLgEuSZuew==
X-Google-Smtp-Source: ABdhPJxHAdNPhIyEhEY/h4/cryx14gzxwTvnqDvWQ2edSk5VVdfaR7tSY1L1Bei9A1l58+XEvcEKig==
X-Received: by 2002:a5d:6a09:0:b0:1e3:3f5e:e8d with SMTP id m9-20020a5d6a09000000b001e33f5e0e8dmr15590128wru.670.1645447090808;
        Mon, 21 Feb 2022 04:38:10 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id t1sm60536942wre.45.2022.02.21.04.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:38:10 -0800 (PST)
Date:   Mon, 21 Feb 2022 12:38:08 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
Message-ID: <YhOHsD4jB9pHpfdl@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com>
 <87a6ekleye.ffs@tglx>
 <875yp8laj5.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yp8laj5.ffs@tglx>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 21 Feb 2022, Thomas Gleixner wrote:

> Lee & al!
> 
> On Mon, Feb 21 2022 at 10:57, Thomas Gleixner wrote:
> > On Tue, Feb 15 2022 at 15:42, Lee Jones wrote:
> >> What is your preference Thomas?
> >
> > I suggest doing it the following way:
> >
> >  1) I apply 1/7 on top of -rc5 and tag it
> 
> That's what I did now. The tag to pull from is:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-api-2022-02-21
> 
> >  2) Driver maintainers who want to merge via their trees pull that tag
> >     apply the relevant driver changes
> >
> >  3) I collect the leftovers and merge them via irq/core
> 
> So everyone who wants to merge the relevant driver changes, please pull
> and let me know which driver patch(es) you merged. I'll pick up the
> leftovers after -rc6.

Ideal.  Thanks Thomas.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
