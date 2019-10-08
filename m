Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB0ED02FF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 23:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbfJHVkv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 17:40:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41013 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbfJHVkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 17:40:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so5187272pga.8
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 14:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZkCeKbP1ys4q3b3SvFig0ZxjSfmMEmE9jsl9r7a5bAE=;
        b=AIH8PdjW+5/M6m8SJ+uxrrGqjlSBUDHJ/1FI/+/9zFjDoPTki/q9Knyb928P4zbS1V
         RUNtxHdFDLYM30uPo6KVgt/HDfwHEDFa930wNLIx0J60saOQ5EgDqZyF4lxV/Bq/Zi07
         UXcpseKL+sAqTEVQIwXL7JuKBZ6yyGb2I3pOS2GqZkHBgNVieqxIDmNT3NQQed+H1qFa
         pI/o5TArQelRBfAxsJsu4BMtTUNWvCTf/2qzx07UnJdeMC64ouMxB8zYbMJp06MtQ5Uq
         EZYOyrhqKoF5UQl1PxQHuF+ghKk2v9pZfKSc4IQyGshH1DsFOy1Z8+ack+6jD4xfLcOr
         heCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZkCeKbP1ys4q3b3SvFig0ZxjSfmMEmE9jsl9r7a5bAE=;
        b=Ulje+sUaFrWCxfY5DxMlgD/VfK8AlbME4BnqBP0Tpd5+NiC4WqQasOOhJFCHCDJUZ5
         oV8Fpzz4RvofLV9pmlHrgRYPnrzSTSunaenowsmXkJtH8TYa592hyy6dxC9HafdyAPBA
         jSdC2OJQRXcLNLom8l1YWMNI9EsQkr4mmvxgLNWm5NNjGZmuVJS2sjr/WevouVGcbhda
         uoYO7ivCoM8EE/LAszsA2WLVOX0nBqcNN0+EVelRkrPmW6nBgPXdFTwvu4/fFTwVrTp2
         KwBjpVtStLR2Bfw/zFISWqarTx9l45p5VpVptDdjbS0wvu6mSj0SGhsUW/JRhnhn9a9g
         Lo5g==
X-Gm-Message-State: APjAAAWBSI2OleK4wbjVFTv4aKezdgYd5UIlwM81dTS7OQsloeGC9RM0
        4ncbaEK0TwdfRkog1zFyP0bGjbgQ
X-Google-Smtp-Source: APXvYqwTS43x/RpGZL9O4MrDtlTWjBbplm+fTqjirIu160Rh5c3RBF/bYypKMzUv0nEfZ4Q7P3sWgQ==
X-Received: by 2002:a17:90a:de14:: with SMTP id m20mr8405731pjv.10.1570570851078;
        Tue, 08 Oct 2019 14:40:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g24sm86295pfi.81.2019.10.08.14.40.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 14:40:50 -0700 (PDT)
Date:   Tue, 8 Oct 2019 14:40:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 9/9] usb: typec: Remove unused members from struct
 typec_capability
Message-ID: <20191008214049.GF16138@roeck-us.net>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-10-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008111350.68581-10-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 02:13:50PM +0300, Heikki Krogerus wrote:
> The members for the muxes are not used, so dropping them.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/linux/usb/typec.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 894798084319..0f52723a11bd 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -209,8 +209,6 @@ struct typec_capability {
>  	int			prefer_role;
>  	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
>  
> -	struct typec_switch	*sw;
> -	struct typec_mux	*mux;
>  	struct fwnode_handle	*fwnode;
>  	void			*driver_data;
>  
> -- 
> 2.23.0
> 
