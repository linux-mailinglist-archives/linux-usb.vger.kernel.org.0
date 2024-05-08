Return-Path: <linux-usb+bounces-10140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B748C002B
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 16:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0749E1F274B4
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 14:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358D86658;
	Wed,  8 May 2024 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MjvOGajY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9662C86655
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178905; cv=none; b=gOXoubL2B+ANcVxuB0YuqzHfCrUPVbsahby0rpfbiLK7koGfIOKc8LeJOfak5XHZCZUsG6KY6idZPT8+PAo9W0LFY45+XXC0u9p2EZQYXHAPdYNZV/Z3v30Apc6hNbbG6i6dmgrHERBY4jTi06XR7ZF3dmqxz9VD4Q1BsUm7ZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178905; c=relaxed/simple;
	bh=2PB06sy/TwQKVGru9MK3yaXQjx7MvEa/iPBfR3uuOfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnj4cqLwwV65EPRUgmanbMse86eEvzvSLD9LPUq6xRRxbX3sVml/ZufY2JofebWBjgrOVQW0tNIDYWiPQGIpiRKlIbFg/ZhH5XONqUOXGhTOoDXyU5MO4Nx18HdUEN5o7fIwsZ993ZZ6a1hEwXGK8uubNR8+gOS/AQMcXUdTMLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MjvOGajY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59cf0bda27so413955666b.0
        for <linux-usb@vger.kernel.org>; Wed, 08 May 2024 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715178902; x=1715783702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=56lgauzQ0l3Lksz3cVVdCUuj0XQA7WpjsiPXs2vf7oM=;
        b=MjvOGajYLzF4RvKivFZ6CBZtpm9fBOFHtHyH0J8mOHBCgdVYtPITmfnW573iZhwvnX
         SgV0JRVG4sS44VZy+pZniy9QppJSrv30v5JsiW9o8uT+tBCzWJ6RDivLKVFndlVN2RfP
         T5KYe4b/0vqJA8e0qFIZGyjalW12pl09rRzQwP9eylquGhPlvB6VbsYjJO+b4hbXX2MP
         76N+KiqRX9hq7U4dFUSXbuTlFDg/vllACqwnYvVTdN9rG9iAXxbciwv8WLidtAjD2FR4
         3pAg3hFJ2qG9w1osaRwebfjk8M5BiZiudle/7ZKxVSQMCXcWe+TDSAl34r/15m33J82q
         ayYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715178902; x=1715783702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56lgauzQ0l3Lksz3cVVdCUuj0XQA7WpjsiPXs2vf7oM=;
        b=ZDmc0Ty4O+olfAMj2vDlCNvW9Lk0itCmEoMPFabh6EvKatOnOei5hbhf9DLlQhGtLA
         RTTivo/Sp/F3684eWBomUpm3x1VkUCjpN3Jt21iomtAAyNfDhpIL6WqOCrlxW1b+2r1Z
         I/p6f8iwymjzGt5m2gjWcHpjnaIAOqA0fugv6aSH+u41BkqSy4hCEwnvumBLGmA6RoGW
         AEcgHtzo/0wTFuNZZcGpEdmn4B04bm29yeX9mGM7jAf9nKeCvjmWe3kSGcC3lDgh2nyp
         PYxZh1oh5GqVHkAUFt/2eDbSxW6LKx2mVxgRggqEOfspGlotFtbZftqNMkHBFuBh7ob7
         eLgA==
X-Gm-Message-State: AOJu0YwhJwkrgexclqTuRJDfNXFfCr2gt3WDTfOI8R5tbsosz9IWNuv+
	mE+WUachbcly57yxPwRWzT0OyL3ci5zNqw2Z8ompVpFbfTwOntnG8HdqA9qpjws=
X-Google-Smtp-Source: AGHT+IFOMgkmkSfwdSdHv4SlLt91gyPvUc1K7jUL/ANISf1r09TRD8iNFbX09tShJPQvUMaKuwOpWw==
X-Received: by 2002:a50:cd49:0:b0:572:7c04:f9bd with SMTP id 4fb4d7f45d1cf-5731da52afcmr2339868a12.27.1715178901760;
        Wed, 08 May 2024 07:35:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gc3-20020a170906c8c300b00a59afbbab7dsm5095777ejb.49.2024.05.08.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 07:35:01 -0700 (PDT)
Date: Wed, 8 May 2024 17:34:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [bug report] usb: typec: ucsi: Only enable supported
 notifications
Message-ID: <bde4764d-ef93-4c63-91e5-8087ce2bc329@moroto.mountain>
References: <dd955f16-bbb9-4d51-98ea-31cad358ab69@moroto.mountain>
 <eo56goqwajv2p3wwfrma2wowv7t5fc6fhfapkb75ixs5rvl63a@4joxxdo7bq37>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eo56goqwajv2p3wwfrma2wowv7t5fc6fhfapkb75ixs5rvl63a@4joxxdo7bq37>

On Wed, May 08, 2024 at 03:22:49PM +0100, Diogo Ivo wrote:
> Hello Dan,
> 
> On Wed, May 08, 2024 at 10:53:05AM GMT, Dan Carpenter wrote:
> > Hello Diogo Ivo,
> > 
> > Commit 27ffe4ff0b33 ("usb: typec: ucsi: Only enable supported
> > notifications") from Mar 27, 2024 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> > 	drivers/usb/typec/ucsi/ucsi.c:1671 ucsi_get_supported_notifications()
> > 	warn: was expecting a 64 bit value instead of '((((1))) << (24))'
> > 
> > drivers/usb/typec/ucsi/ucsi.c
> >     1665 static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
> >     1666 {
> >     1667         u8 features = ucsi->cap.features;
> >     1668         u64 ntfy = UCSI_ENABLE_NTFY_ALL;
> >     1669 
> >     1670         if (!(features & UCSI_CAP_ALT_MODE_DETAILS))
> > --> 1671                 ntfy &= ~UCSI_ENABLE_NTFY_CAM_CHANGE;
> > 
> > ntfy is a u64 but UCSI_ENABLE_NTFY_CAM_CHANGE is unsigned long.  So on
> > a 32 bit system this will clear the high 32 bits.  So far as I can see
> > ntfy should just be a u32.  Either way, the types should match.
> > BIT_ULL() is the way to do that if it really needs to be a u64.
> 
> In my view this variable really should be a u64 and the definitions of
> the UCSI_ENABLE_NTFY_* need to be changed to BIT_ULL(). This is due to
> UCSI versions 2.0 and up definining a new notification on bit 33, crossing
> the u32 barrier. My suggestion for addressing this is sending two
> patches, one for changing BIT() -> BIT_ULL() and adding the missing
> define for the notification of bit 33 and a separate patch to handle
> this new notification bit in ucsi_get_supported_notifications()/ucsi_init().
> 
> Thank you for the report and please let me know if this sounds
> reasonable, or if it would be better to split the changes in another
> way.

Yes, this sounds reasonable to me.  I don't know the hardware at all and
didn't know you were planning to add a BIT(33).

regards,
dan carpenter


