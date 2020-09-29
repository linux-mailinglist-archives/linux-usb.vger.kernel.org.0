Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC0727BC41
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 06:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgI2E7P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 00:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgI2E7P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 00:59:15 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B430C0613D0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 21:59:15 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o5so3730887wrn.13
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 21:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y04EqMVFkBzcj+7faiDnptPG2EPf5DBzCvgB7F8ZLVk=;
        b=XTjjO+ZRKyufsDE4gV5oFHDCRXkke0BIVkzB6rY+Yu74djsAQy/oYArlxMNDh3eOwA
         HN7AYFGH3BazOSzZdVI0utcVmHHAVQL08Taq+aqlSHRwEyQDu76gxfqEgiAapCZ3Eo36
         uK76aE7VmOHFrbqw6iY0VQKtGEVbk7/hCEX3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Y04EqMVFkBzcj+7faiDnptPG2EPf5DBzCvgB7F8ZLVk=;
        b=pTc+KszFM/t3sa7ON7+MqI78PcKlMcBWiTb7QqMSaynzxQLZzLq04EPpSn2t1xCz2v
         qwvOs001GHFAMUlDsZ8ub4u7Uvpy2IolEIhfDSVtTsQfUT9iMZ7353tF8sE/kXVwpmsO
         BpEo7ZxkurXlenBGrzE0DIvqJRd8aEYEAyUjoTnIY81edUGzUPSP8SOcTDntA4inbXYN
         BWIQLj2lfcOZB9W1Cch2+ZGwkjUgjr+A4CwaVuZBFOPhluG60WEimcP7P/wKTcWlc2N1
         Kpca1IQwJEMbc1Fm0I168OQk/8NWoYZ3DPX4IrMvY68kwwhtug3ZitewtuV4eewshnLP
         euPw==
X-Gm-Message-State: AOAM531tMJGZOqoKWIzCiVno6AkuzxZE2sJ4Jky53fucaVtapXeRyZgz
        RCIZvQIG0n7g7s0rdFQJOmrwbQ==
X-Google-Smtp-Source: ABdhPJxOJlZ1cmJvb9fe9swzHMZBB11w2EiwtoyIwtTjc2EEkee/A/BegTXUhNHkEAJMnvXdQl4E7w==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr1832099wrn.45.1601355553776;
        Mon, 28 Sep 2020 21:59:13 -0700 (PDT)
Received: from carbon ([94.26.108.4])
        by smtp.gmail.com with ESMTPSA id p3sm3506347wmm.40.2020.09.28.21.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 21:59:13 -0700 (PDT)
Date:   Tue, 29 Sep 2020 07:59:11 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     David Miller <davem@davemloft.net>
Cc:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/2] Use the new usb control message API.
Message-ID: <20200929045911.GA4393@carbon>
Mail-Followup-To: David Miller <davem@davemloft.net>,
        gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200927124909.16380-1-petko.manolov@konsulko.com>
 <20200928.160058.501175525907482710.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928.160058.501175525907482710.davem@davemloft.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-28 16:00:58, David Miller wrote:
> From: Petko Manolov <petko.manolov@konsulko.com> Date: Sun, 27 Sep 2020 
> 15:49:07 +0300
> 
> > Re-sending these, now CC-ing the folks at linux-netdev.
> 
> I can't apply these since the helpers do not exist in the networking tree.

Right, Greg was only asking for ack (or nack) from your side.


cheers,
Petko
