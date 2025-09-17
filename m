Return-Path: <linux-usb+bounces-28188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CFBB7E10A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 14:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0B4B521494
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 10:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643ED35335B;
	Wed, 17 Sep 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HTt4Nrr4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0112134F49B
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758103853; cv=none; b=gdTwcdQnOfVG5ADblsDI5iKNPrTBCoqDUxgFNK2C60a4kkOjrdM06IXERSjsXVx4VLn9owBjJS8uAWrcJD3eYsso5pBoGfIStBy1PBGaZf/CgXzwqaGQBH5wo7XpYaVVlm2LbkVTCmUa489PLBKLE6nkdMkv8jhRTBrQYeA9wHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758103853; c=relaxed/simple;
	bh=ZZVPr8zwc3jcO0OuCGyJfEYik/KPMCAqckFIByRhOZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzy2L2PfFI5q0LsMJyIjWJ5wjcQz7KbUPFeXtnRHXMfdOuG8Oa94z0dzD8+Zx5GAAFnfd0vzeiOk2/NCBa/d3cF3QuKutgKuZyLy7wkN+0VQC4nMSEW+jkNtjRnL+duWnoKdx6kGPoytXEeKkcYlR4MxVbP3FvbNtoOVIl4L2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HTt4Nrr4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b00a9989633so165632466b.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 03:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758103850; x=1758708650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfhBOmsmCdqnUMz/+8Ss3Stx4dtkUPFOWgiDwJ5M/m8=;
        b=HTt4Nrr42awsw/sWUUmkJaZXN/VLbWtlFTAMScXNR3O99EntNwP3wnXVCsMrz6cEK5
         5LWmcm07ExLRuQMwYcEOZJ+KFyBT/C0vw604BF0B1kN/TACYXQVfJ5c/tvolRvdtZfg2
         iiRH5JEZ6+CP33Qr7uYEVTIX9K/WJm82bG5+PkHJotTgUfMvptfkI2ANdD2XVbyv6B/E
         fzWXURrSyJSIIM0nmTHvg4h2ci6fw4x6aJRnxiRXGqEsOFxxHsjVbz+eaPrIGg+wc6Uu
         Lj2yDsNSVm0CEzUYaYFwI/tj8EPCGUMvvvlISA1CVvsQ/o3oOn02SSrnxf9igWnyyWUD
         MOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103850; x=1758708650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfhBOmsmCdqnUMz/+8Ss3Stx4dtkUPFOWgiDwJ5M/m8=;
        b=fSN5uthsXS/Wul/LkHbA8D23XL40NYvSG6R/AarNLFTSNRqB/RcYwehadcKPkDHU8h
         K7dDAPFdzo+kkJ/NRC4AmZbc9Iid3rAUlrDmBShxG6uDV5CSaWCsQqsHHq4bevJGtK5d
         N2ERfiBF5Ex4EDZtwu0b5jwgpZUVAbU3vVF+1xtjcBeWRYp7hwHplwSMHXjhvSH+zXfb
         g79nUXv/LAnYAJZfsdEv/kVpK2i73reFIC+o9kiUxMFVI7bwbnI6XpliXcQooNHCQj1S
         zg8/stWJQOyJWovE0lfKrgB40SnoDz/rvvzpK4r8RjV+I/4SpEi9h4bs64Aabq5MuVnH
         KvFA==
X-Forwarded-Encrypted: i=1; AJvYcCWrmKdZHmGZI16lvaOII5QZ2VWi1n5BoXQNZ9ZcU2nhxwox3zQjJA9BlCWJp5iehQzLi+9yX23Zk+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE61K9mzk1CFIs4QoXQBua+Gh+LSlkt43DyL8jhESfMUtDkl6o
	Gz085e4E8eZsMqJ6ppnVRoFtNdkLdoM8ZrOHKUZvhYfPoWwJwm4yAImxJzC6sAqOJhI=
X-Gm-Gg: ASbGncsUUVSGXDWq0UA08Nmgv4mcp1/SrXWcQ+Uc5iO+NhIzG8Shavhe7FpAPY/pzBX
	P4dMOgPxQr/rjJxYBYKRm12FDCjIu2H/KCWb32qp9s5rY5zx+YuiqrG/Ag/oIH9WK87loBtrR9n
	qEWWWWZ5bhZf5lKVjkcedzr7UYgCRrOQr2X0dG/A67Krm901rrlJmdNT8IjIfx/uR7khFfB7fNF
	fn2vpmvLFJwGC935Z7IJGW6Y+53MXFReDYvaBdm3MO62Cu5cGD28QnG3QhfF2CBi2MDcmv5yspj
	C8LzlcDBgYAqKff7gN/tAlOerEQt0drZXvPnSAR7vEeQV9PmSvHjgzNnuVpGXfRWljUn/gux6ee
	zVH7Y8AB63+uEvNLFGN7wUz2I9hHPB0LwYu/FZfiBqSWHbt0kEKuf5XqFSOtLGLWk
X-Google-Smtp-Source: AGHT+IEffrTIn04hCkbbCjr83BNBKSLUY7sk2TJEFlqvq5wVXFDKpBzk6i+bXHi14sqiagolHGQ+ug==
X-Received: by 2002:a17:906:c106:b0:b07:c66d:798b with SMTP id a640c23a62f3a-b1be49e1b5dmr185057166b.11.1758103850321;
        Wed, 17 Sep 2025 03:10:50 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:ff01:f29d:4e4:f043:caa2? ([2001:a61:133d:ff01:f29d:4e4:f043:caa2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d2870da1sm1004985666b.13.2025.09.17.03.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 03:10:50 -0700 (PDT)
Message-ID: <0f2fe17b-89bb-4464-890d-0b73ed1cf117@suse.com>
Date: Wed, 17 Sep 2025 12:10:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/1] net: usb: asix: forbid runtime PM to avoid
 PM/MDIO + RTNL deadlock
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?Q?Hubert_Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Russell King <linux@armlinux.org.uk>,
 Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org
References: <20250917095457.2103318-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250917095457.2103318-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17.09.25 11:54, Oleksij Rempel wrote:

> With autosuspend active, resume paths may require calling phylink/phylib
> (caller must hold RTNL) and doing MDIO I/O. Taking RTNL from a USB PM
> resume can deadlock (RTNL may already be held), and MDIO can attempt a
> runtime-wake while the USB PM lock is held. Given the lack of benefit
> and poor test coverage (autosuspend is usually disabled by default in
> distros), forbid runtime PM here to avoid these hazards.

This reasoning depends on netif_running() returning false during system resume.
Is that guaranteed?

	Regards
		Oliver


