Return-Path: <linux-usb+bounces-35727-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LLcHeC7y2kpKAYAu9opvQ
	(envelope-from <linux-usb+bounces-35727-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 14:19:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D42D8369611
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 14:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAEE93067777
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 12:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F7B3E1D1B;
	Tue, 31 Mar 2026 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L++l8eWj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09A32A3C9
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774959341; cv=none; b=fz9pKkwwstqth99rBtWoBZfjHccsnQSo16hg2Fes1z9vryBw//tyPwP2p29HqR85jyN3hyLm5zsgQWHfI53TZqklBiLuZ/7pMRfq958toIlyc8pJcuoTImzaX0e6UpVXDy0+DsDYhQg5NpSjUK2WLdwcABneu0ALhJNY/fG0/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774959341; c=relaxed/simple;
	bh=hm4Ma4vk+10ks06oT9jA01taD0hMQ0Lh4zE2mDsbYuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/bxFgVejdsYh3Mc8PDojgsMb3xd5vXbyP3mlCm+NqXKF288L2CJWhqDSSgMGDVuELzYPym7IB4gZZmH2X1CRT3l/DjEj7cN36Pu91TT4PN0/QD//go8uFFPXpY4nvE5l51kJvuNfQSXjDuNOs/WKnGzw7w92m4aCwWCSumM2xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L++l8eWj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe655187so73633445e9.2
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774959337; x=1775564137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Xo3ZpJ8Dl2Flz8g5rck0pTn62dakfIgnmjeFgZwkBg=;
        b=L++l8eWjAIUre+OMPfxRLQcPmBGlFeCOBJdS8p8Yx+cKCmrHeMZyq4gDIieYqbTwze
         0kkCoNKjH/nVA+XjoGKx/LCkwnWOw/i5fqS5TAuEru1OdpyB2P57NktAfzxWpcq6GVI9
         0+D/ZyjYPNQD0D834up+foTNWwdSTEKX7u3MlPPjmA5TyNx2KGww6RrtJWciGMCKTP/a
         kDEB6VSU5Jsnx06xs5rcuKyQviDzKGJ5/qNJYeHvBI7a25g6xoPY9q7M7+IhTZC0n0lJ
         LVnvDdFVCv6pYMRPpRtI6SiTeJCh7jRzioXgxQJaaynni5daA3fhbkegu/EiRbCDrJlb
         W0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774959337; x=1775564137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Xo3ZpJ8Dl2Flz8g5rck0pTn62dakfIgnmjeFgZwkBg=;
        b=ENbNxmeGzsL84mHM2E2pLL7pSmVNq+KVyhkvzkjIGrSr8gbGIMEKt2a/MxKOtvwxEs
         rdP/ERot6ztS+/N+AL5AsDLY0wedFJ2+p4I4InBAtMp4TLoZ7N7+b0BkSL+B0KxdTJRH
         efDA3fNMx6dPUr8zth9A+n/E20cxAUonR2H3P+LNTHGI+9BQv1ZtJdgW+3JIu7KeiER1
         /VMpxk7qbqys63fUe/dQ3eIUkdGhezZdKpWXOe2y1tZSto+JZ6b8SPKwPtAm63DLhKA5
         TUWpMa+JEVoYUORHATzdhTt9aFANalBuwaG+BNoz9qU1nfY7lTUVxVUS1cEBApe9qPoE
         ajZA==
X-Gm-Message-State: AOJu0Yx31B8zh37xKBoTgLsBqhYKKDxEITRp0DoRVHD7DBSSWhOPrbgm
	j8s//VyI+p/jx+BzsYInutBj9yswGewaMkrhogHpfcs/dqOclY1Et4NrljNUzn21hqb+993pzuA
	+xR/opGS2PA==
X-Gm-Gg: ATEYQzy1r+B2BYCKpw9qw4oDfNmu8dDKTTK4Inlt3Yv6PahlJ7JqGLYlhyAcYAbBHKk
	Nw1cCxgqaUMoyg5vSMq4b0ukzPz3nCerpYFUu2zs5/mr2rMIx1VEJIP0EVI+K6ssoFb3WFE9iTM
	PlSbE85yiXGF2EzFGV5FTPQKiS6WXUrjE8CrpdaZchef3Fiq3nmr9ReihCL1ZkIBW4cEqf2g5hc
	23usJHnnF3o4E7ErvxxtTyftTIzal4dbthYa3VTPkO6HStRlnDWQhQVjI/x7VnNYEiRjDH5vTpe
	/FdpO8IXoJiWu0p8Rlj5yerKlJVbisRC4903ctyiow15spnbzGVmKOyd+Tu5gvcFm8Eq9H75G3n
	oFKGmYuLUHiRRtVfCqgywhmKP/88lVPA2uISVJtl0AGlXWz/HXwu+t9PaIc7ttr292BAdqby0XF
	q11NKnVExwnnDFCFhtyS4qwKaqLxLS9bqF/iihBUToRMHZDIA4xXChzzJxvcd7LeX0a/U=
X-Received: by 2002:a05:600c:3b24:b0:485:6ec7:2df with SMTP id 5b1f17b1804b1-48727d5f7a5mr278725665e9.8.1774959337174;
        Tue, 31 Mar 2026 05:15:37 -0700 (PDT)
Received: from ?IPV6:2001:a61:1379:a401:6839:7a39:6f33:47c7? ([2001:a61:1379:a401:6839:7a39:6f33:47c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a630901sm25614755e9.0.2026.03.31.05.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 05:15:36 -0700 (PDT)
Message-ID: <e499275b-dd07-49db-a685-57d525f49464@suse.com>
Date: Tue, 31 Mar 2026 14:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: usbio: Fix URB memory leak on submit
 failure
To: Felix Gu <ustc.gu@gmail.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Hans de Goede <hansg@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-usbio-v2-1-d8c48dad9463@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260331-usbio-v2-1-d8c48dad9463@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,kernel.org,linux.intel.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-35727-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: D42D8369611
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.26 14:05, Felix Gu wrote:
> When usb_submit_urb() fails in usbio_probe(), the previously allocated
> URB is never freed, causing a memory leak.
> 
> Fix this by jumping to err_free_urb label to properly release the URB
> on the error path.
> 
> Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
Reviewed-by: Oliver Neukum <oneukum@suse.com>

