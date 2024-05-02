Return-Path: <linux-usb+bounces-9988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0648BA376
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 00:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402AD1F22113
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 22:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A61B1BC44;
	Thu,  2 May 2024 22:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nlqh8cwj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C61BC43
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714690077; cv=none; b=KKSgNmq42VrFgw8LU1GFwyM8EzEbOObD1lvzRYoet2/Nu8QCA+wYjIldhPXaNUJBxqeACpMhXcaTdGwKPP2fCBG2SDlmJb830kHg3hLWrHzwAl39+4RPI5sTbwTk3Y8b0XPCJjZedhOU/XvHXuEio8kZzKbg3kBwi2DRA2tSD54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714690077; c=relaxed/simple;
	bh=ExG1KgVjgCOl88UQQAFgXZUsw2+ya82EI/LQrOPIBOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cj4ge1KO8N9UKgq4yQFaBJGlStBHMqMqN9JRAFICzIJ4wAGlBuVqwJjVnsQCTHnxbY3Hlszm9MwvRpCp2j41nfQHi9Q8sIBNgYgmespmcljQVBgMKmH+X416J84/EMJiO+gd1mfGhtIPwNV1T0aqhHlFa+9uhzi5kBeWdfq3Wb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nlqh8cwj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso2706a12.0
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2024 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714690074; x=1715294874; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ExG1KgVjgCOl88UQQAFgXZUsw2+ya82EI/LQrOPIBOQ=;
        b=Nlqh8cwj0jvXh8T1Dr3ar7pvlruAslj8PcTJ6SZGfI++ThcAYVOPLG22hYsvkF+9bD
         HFcoVULzVKCbjhFOTPdXJwUEjSV7XL31kg7lRB1wMuP92J0r/rWuqNVRzymw5Z07lzbQ
         QdIahAc/IZS5PRH/5zoflXB8JxfxiIN4OtVLtRbfcVGx5lndTnSYeS8zRWXBmimbPpnD
         f2caYbgDLdSiB2UWKd+Omdzp6NvRHr+fH4QDRO1GdLVWBx3Jfw1EFocX2jsQpyZnIZ+Q
         CyNwjwdwWdH2rjOOtHgFp/fVxFABHX68I4a36th5coPQaGiPPdSLWJIzyKCRfREEsQph
         4nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714690074; x=1715294874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExG1KgVjgCOl88UQQAFgXZUsw2+ya82EI/LQrOPIBOQ=;
        b=VrcoqDojSInv5nulcUzHuts+cABdO0IW7u0lnrdtmT9g6YHk66UD7SiEeyz+nEXG6S
         5o4uwNtIYXw+zwZ8CO/WJefKzc9AAY9VtD3xAz8v9Ognwb8nxb7UK3YSsyTmtSIRAEbW
         dtPnHgQtPXCC8fFfNHk8ge19oNlCKXUaJ7eageW9men2NpkGGbX9n5r+tDsG91zEYeyY
         6guFE8Q5kKaoJPZYFBUXCQ60xzyhNEamqJyG/JJWBQdtXu2yeqsJV7nbm8nCllNzxvvv
         h5LVkq+Hw8P1Sk0PqBRro2oZH97yR/M1PFDm/I0wivsX0nAqsPyz1TNaMRniSnLhCPYo
         fPUw==
X-Forwarded-Encrypted: i=1; AJvYcCWCKR31YiZZebud9lZ35tvAevgQH7vDNlayQEu1E5j01gYHy/hZEoQCRdFU3CY1x5fhVBC1bi2W+QkIz2YtRPU8X1LMbmRI/yip
X-Gm-Message-State: AOJu0YzVcT3S0JC2RBurwm2Rg1WEpUYqOwL/+Wr12wPgSFx7QcVtMgaj
	8bAKG5bZjsQrsFuxI2iQjkhoYNCvmq05PQg3Gtf8STgCbBMQ1cFH/9BV0o4P34fsfP+a2jdtF7B
	o/DNlO1WgIpvV8ZzqEqfbVT7DR4SxgdKugus2
X-Google-Smtp-Source: AGHT+IH0mH0uuFK4eo9VqCSk6dbse6pHTLPv0svOXhiAHh6fPUqDd2nzdBnpLjnGCKpRjVOyTQkOdSMLT3gSxWvi9ys=
X-Received: by 2002:aa7:c44e:0:b0:572:9eec:774f with SMTP id
 4fb4d7f45d1cf-572ce31e083mr67905a12.0.1714690073746; Thu, 02 May 2024
 15:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424014821.4154159-1-jthies@google.com> <20240424014821.4154159-2-jthies@google.com>
 <32855f4c-f219-4396-81c3-42cbea9fe4da@moroto.mountain>
In-Reply-To: <32855f4c-f219-4396-81c3-42cbea9fe4da@moroto.mountain>
From: Jameson Thies <jthies@google.com>
Date: Thu, 2 May 2024 15:47:41 -0700
Message-ID: <CAMFSARc7GPZuvX1wbyvz2uPUeORObuw3=JQ1QwKYRenaofXvBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,
thank you for the reference. In this case I think returning NULL from
ucsi_register_displayport stub and using a NULL check to prevent a
NULL pointer dereference won't give us the desired behavior. When
CONFIG_TYPEC_DP_ALTMODE is not enabled, the function would return NULL
and the UCSI driver will never end up registering DisplayPort
alternate mode. I'll update the commit message to note that this patch
adds a fallback registration for DisplayPort alternate mode in
addition to simply fixing the NULL pointer dereference caused by
returning it in the ucsi_register_displayport stub. Separately we
could add a NULL check, but I don't think it's necessary. Neither the
non-stub ucsi_register_displayport or typec_port_register_altmode look
like they will return NULL.

Thanks,
Jameson

