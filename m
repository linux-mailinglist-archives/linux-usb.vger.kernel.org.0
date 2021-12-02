Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B7C466A76
	for <lists+linux-usb@lfdr.de>; Thu,  2 Dec 2021 20:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356092AbhLBTcp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 14:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235859AbhLBTco (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 14:32:44 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B005C06174A
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 11:29:21 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id r130so544818pfc.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Dec 2021 11:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hqjfXVJglMFd2amgIPEC84S0uybWLeU6WuVwI57Usjk=;
        b=BlczXAsQsvVkkQ+D5LzJ1NjVLMG/DbL5LmVIxD/0fwQ8A7WHQgaICDL/hAKaE+Fpv+
         ygd/fTFvLIlrYAHoHDz+yySOrdgfc8iY6PguUzsKg+yjFkW7EPno2+c5T9clAdML1OVN
         3rHKPtvfVnNL339B/F7U6W38OHSZME/X13EMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hqjfXVJglMFd2amgIPEC84S0uybWLeU6WuVwI57Usjk=;
        b=wxzwqUR4nXePOx1hln8ZeFHBwdWsmxlIuPatZIBv/OP1/jppO2cOF3xf+SGFqE7ANy
         +lxzhonDeIXsmajTHQfu2LaroWzuQgHQrdMXamc9XWpKS2xq4vAngbBYnQGdB6jb4UXl
         U/u1mHKhyf0CvrYELpfAVVKnexIDV0n2KSeROG/TD4xFPygHvTsSpczW3KtmX3MddyuK
         AYI58bZlBKy4G/T28n3Jx77d+5fVcRURY6tg3gvDs7p5bHIBfLB/TSEwBG+3ZFfgvX3P
         Lg11IxQ/eYMkk55u+SgKYBHmgHLTJsxNSDRBvNE+V8iu2H5uqdMQYHs79TZfp5/dGbhN
         QBIA==
X-Gm-Message-State: AOAM531ggUsxLNgUs5s/aW0fXCBk2PAFzX/ZN5ZZ5mxSyhCKc+RHMfeU
        7LeKQY5HF8b8cjaAUOlTktIPIw==
X-Google-Smtp-Source: ABdhPJzc6qoWc/2+7sb2nt26p984INtuKCo0EqmCZWkJljU74OHmriEsp9uYzbSFLZDNU2l4YyRMug==
X-Received: by 2002:a63:f954:: with SMTP id q20mr899839pgk.13.1638473360874;
        Thu, 02 Dec 2021 11:29:20 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f780:259b:2241:cde0])
        by smtp.gmail.com with ESMTPSA id j7sm3459929pjf.41.2021.12.02.11.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 11:29:20 -0800 (PST)
Date:   Thu, 2 Dec 2021 11:29:19 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        bleung@chromium.org
Subject: Re: PATCH 0/4] usbd: typec: fusb302: Add support for specifying
 supported alternate-modes through devicetree/fwnodes
Message-ID: <Yakej0+7W+Lk9OWP@google.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714113617.10470-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

Sorry for posting on an old thread, but I was wondering if there was
still a plan to submit this? This is something we'd like to use on
Chrome OS too.

It sounded like the primary discussion was whether to have an "altmodes"
property encaspulating the various alt modes, but not sure what the
final consensus on that was (sounded to me like your current
implementation was fine for now, and ACPI use cases would be handled
later?).

Best regards,

-Prashant

On Tue, Jul 14, 2020 at 01:36:13PM +0200, Hans de Goede wrote:
> Hi All,
> 
> This is a replacement series for an earlier attempt by me for this
> from quite a while ago:
> 
> https://patchwork.kernel.org/patch/11199517/
> 
> As discussed there, this series implements an altmodes devicetree-fwnode
> under the usb-connector node which has 1 child-node per supported
> altmode and in that child-node the svid and vdo for the supported
> altmode are specified.
> 
> Note this patch-set does not contain any devicetree users of the
> new bindings. The new support/binding is used on X86 Cherry Trail
> devices with a fusb302 Type-C controller (special variant of the
> INT33FE device in ACPI). But this patch should also help getting
> Display Port altmode to work with the mainline kernel on boards
> like the Pine RockPro64 and Pinebook Pro, which is why I've added
> Tobias Schramm to the Cc since he has done mainline devicetree
> work for the Pinebook Pro in the past.
> 
> The 1st patch adds the dt-bindings docs. I'm not sure if this one
> should go upstream through the USB tree together with patches 2-3 or
> if this should go upstream separately, Rob ?
> 
> Patches 2-3 add support for the new binding to Type-C controller drivers
> using the tcpm framework, such as the fusb302 driver.
> 
> Patch 4 uses swnodes to add the altmode info on the earlier mentioned
> X86 CHT devices, making DP-altmode work there for the first time.
> 
> Regards,
> 
> Hans
> 
