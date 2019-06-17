Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E773483D9
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 15:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfFQNXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 09:23:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34846 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFQNXy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 09:23:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id c6so9109120wml.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2019 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MCk0UOttsjHTOmjWH/1wGCIVEMWTEE7JSr9eSJt8E6U=;
        b=bLYB71SoakdZWD0bbECjOZJpTdloiPafIY+LfUEJDGwY71oMCbzPqrfRdvuCruNWE2
         Z+qz9f9vsaeBGq/9asrdH8Mbm5YhHQgJTCIuHyw354P4+ZrZ/6dFrkwbFECyXZxQ1Qlz
         gth04rJNMbeXq3hzKkApLHYFKVjT6rW7WUaHWECkpti41bOC/FFL2Ce0zBEd5+qFBQaE
         DkxDjumSNL1g1YJWqj5O+dUQ0d/aheJuKd6dTCgdgqZopQzAKfh+mkYcY9tdItS8wXiA
         +KXAT4cV1mdqlwVJqq0b7RBPDVpQOtorkV1Wq/5Rw++d3HSWAaDPaUlkG8eOHiMz3G7m
         rmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MCk0UOttsjHTOmjWH/1wGCIVEMWTEE7JSr9eSJt8E6U=;
        b=LJg8H3rzEo7aPsD9ub9Qj2vzPJJAm9gusVlInHIgdVdbjVRwS6AGM7YfRCHu8RceGl
         JiustUoTSNA0KgMRB5bobm8RuqA59BWY+0kFjOk3I64xOf2cQYVdVAswnSpKiOsMiRAt
         TSihy66HO/vx27DCki0nko8QXiHMQt7JwgR+CQ4uo4GJ3qgIvSdlzGAu7chmY1BZMbZs
         uL3yfFQxaIBx1INzUI3Fvm4vgdV3WpCk0/kt5Kg2nZKmP3rEzrtSmNJ3Sbw1VBDbyzNF
         FVcFaADYLlL/cYfds6J2Emd4JYcP9XcI0nG2oS3Kkg7EEXZeU8Yd+nSLzaVUDWX+SDNn
         lLmg==
X-Gm-Message-State: APjAAAXlU5jU3Z1Fzm6C2ksLLZXUyZ39ZmUvRRl6q5UOWxiEtJdbOt7H
        DsbTNMMnQ6diznb+Hk9WMTz16g==
X-Google-Smtp-Source: APXvYqyrzflhrnZXLI/k9VPq8CsskPBB/8KzjstR9LOm9dfd2dHTNp7j6C7TFEfXsWqkUzxuqmhaQA==
X-Received: by 2002:a1c:be12:: with SMTP id o18mr443929wmf.21.1560777831804;
        Mon, 17 Jun 2019 06:23:51 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id u25sm9662835wmc.3.2019.06.17.06.23.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 06:23:51 -0700 (PDT)
Date:   Mon, 17 Jun 2019 14:23:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v4 0/4] I2C: DWC3 USB: Add support for ACPI based
 AArch64 Laptops
Message-ID: <20190617132349.GI16364@dell>
References: <20190617125105.6186-1-lee.jones@linaro.org>
 <87lfy0gym0.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lfy0gym0.fsf@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 17 Jun 2019, Felipe Balbi wrote:

> Lee Jones <lee.jones@linaro.org> writes:
> 
> > This patch-set ensures the kernel is bootable on the newly released
> > AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
> > changes have been accepted, leaving only I2C (keyboard, touchpad,
> > touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
> > camera, networking, etc) enablement.
> >
> > RESEND: Stripped I2C patches as they have also been merged into
> >         their respective subsystem.
> >
> > v4:
> >  * Collecting Acks
> >  * Adding Andy Gross' new email
> >  * Removing applied Pinctrl patches
> >
> > Lee Jones (4):
> >   soc: qcom: geni: Add support for ACPI
> >   usb: dwc3: qcom: Add support for booting with ACPI
> >   usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
> >   usb: dwc3: qcom: Improve error handling
> 
> pushed to testing/next

Sounds promising, thanks Felipe.

OOI, what is your process?

How does do the patches typically sit in there?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
