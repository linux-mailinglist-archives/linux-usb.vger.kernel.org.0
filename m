Return-Path: <linux-usb+bounces-32680-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMjmFH81dWnUCAEAu9opvQ
	(envelope-from <linux-usb+bounces-32680-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 22:11:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3E7F039
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 22:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0358730022D1
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 21:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B58280CF6;
	Sat, 24 Jan 2026 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUZnN8bR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A627B34F
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769289079; cv=pass; b=aMUD+qZwQ6YcyTCSGrpLm+/BPGHoZ91cDoph57KjK2vk+laRuajpO7BBqe2827vVUzpL4/1pcFYv264IDRh5nmc4rCX+2AZnAswTKLTSVFYkragdQxYa6ou9EEjCVWldkcINBreV98bizwcyS9n24Iw6SkpRiCIh2627O6ytPww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769289079; c=relaxed/simple;
	bh=kiFIK6l3fQ8jRlvxIxqA/vQFUYDACBhvkCt3X+WfX6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRhKGDefwTRDsHqtlhXbAvbum4pplG0lcVuwQ2T97xsgaa+EyAUVVn2x77bb+HQFhr/iOgrAQj/3cHPuvo3hb8ovF08BNhhdIA8lJgRTPopoQMS+6tnE9Yn2uMf0aRlDpjZyHcMFLp6JQBBoX4ZVVmsXttJrx/BYSKkbx33dXJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUZnN8bR; arc=pass smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso42089486d6.0
        for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 13:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769289077; cv=none;
        d=google.com; s=arc-20240605;
        b=NDDrvvb3P9BZ8Gq+xg9pcz5BPrr071EJ8uQVAHSjYjGsGCyA8ExE8f2axsSqJu2pud
         pGiYWv1sdnMPxF1er+K/T12owzLr07BY8g23RLtT/EBLwOvr+YdJgVV6Q7ikv0iA3DWL
         TFOvOjK62ha8gQH1FZ5RBDfy5DVhB7uUHlH4hAOElWyZg8eP/HDFpb8+R5qWMojW5San
         pUsomXO7wnWa66Mwc7Rww62qFzEky+YYaepZ12YyzbnY5Gvl4Zn0Yaw5QYItkKMbyOtk
         EVSViade69w1sQg5wl74ryU7NXnkSZDFp8gAmVCXSCCdTB+1GhHJznnBzE503Jbf5/ht
         QbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kiFIK6l3fQ8jRlvxIxqA/vQFUYDACBhvkCt3X+WfX6E=;
        fh=4TTgZ8CztrIzd3G03dwb6qtHuj3RyU99tbJVx8Nts+4=;
        b=Ra59l2CIPw40n7nTp6qmzpuL1qJI+yiGlLop4SrHd0m0PcFV2tXKJnfyGOFoWLhMek
         G3YRWFjlOv8uwq/RA0IH0/G2GyfiEWJqfiZLCsO1s1PUe91IqXX7kMCGzwNSYaR8pc4E
         lw3aYngf2FHKIojPv6/F313gH5pGqxZqgj19HQxp2qLp1mr6DgzjCWXb6doq4JDrn0cP
         UOituwngKfi0/gP5R/spWXOEA6oGey+RkgBFSbEgdaJz3yXKGo0+/Ng8ByfBSAS1N+he
         tyCGSfgcxmDqmEfP6L4ADuuCgy1HaF+SBXLzNKHHJpJ1BPzTg+ShhTBqvFiqtiKUjmIe
         gXOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769289077; x=1769893877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiFIK6l3fQ8jRlvxIxqA/vQFUYDACBhvkCt3X+WfX6E=;
        b=aUZnN8bRiqXroa9zct3uOYszdYWjfuhKzx2UzWLgqOblVa7sQbFroDUJkPs5H2Xb66
         AXum3biBrqI8Pgcz0iHareowTOy3wUq/F5kIF6EmPHlOx6CA2DJAzVZu2o2YGLegS3VH
         8Zq9cv59BG/qkqmO9GjdG94y6Q7vH2GxuqAfgzamX2u4vpStIXRHqz2Dqa1gBQVQhttD
         PrFt1XBzR4twuvnGPDhswCgZi39qUvbvAvv6lVOddoR+fLh9VOJ/log2e119LgVOkftM
         6XzR89uZ/SNVputVjFH0VNgGXk/gmE77NhMxehPHa4JGYZZmiw+BlulpvVHdMBRUYblM
         BBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769289077; x=1769893877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiFIK6l3fQ8jRlvxIxqA/vQFUYDACBhvkCt3X+WfX6E=;
        b=ooWyqaRKMH0/vsMR8GHzd9jshuRe8/0U/ueIA6f5I1CNoFSROlIzMCRgO3ySKI1W7O
         6t/W+35qevENNBHwWg3YeFmtxHdxHqMKzKFOowkT5WJfu0eR2yYI1CiJxZTOtUkUb95P
         fZRIQa0gJOo9kC/lv0v1YPcHe3OuPgLU5vFP3bMYirTR9Fv+StPj1P9y17QH57h2qLRN
         OQXe/gWrDeDiIodnmv0vSSJI2jE2k1mPp366wA+7XogCk4YZT9Qy/wl0u+diu9ojcklZ
         tVEWIp3fR+iI6v1zfZMowgt7MFoXIFCDHojlpt+HPE9BvqmIRf4hSlmj7eLYXa8JwZj8
         4FWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsMDQoB7Qk7bSQR9fnlJeFueNBHW/8p4UHpdLL0W9IBEz2iiwjaB9tTHPgkfs4ntkHjMX7HcnQ7PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXJppWo8jUjyqTYT90veP7mqTEC0jNvB9H8kEayP/LJ0eWfPh
	A94r3vjU5vhq+2QuoTShUZ0VVzFOQzhxOdeaE/e0+BSJEuhvJXWX8R5hF0wj7QzOvoUeDVdBunc
	4f9vdwFXSrqPZ7PyI2oTzFzvdF+okJ88=
X-Gm-Gg: AZuq6aLpaCrWDQ6lq+uGWxXL/ToS6NR8y0WzH1whfTvd8Iqr8LetTLRuEPq8Y5L6Hnp
	XosTSk9vKmQT2dVQOHTisSaXTwCYhBx9W29h+80LZ25NIc2+33ySRpnbQNaX2j4f5M/H+WwRzs9
	HeIWwM8CAPuqiLDk23YboC48hOzJO/EJJ37iGBFr4wHQLjAW/1NGIj8qM7N7vErFv1e96CkelZW
	7314x2/KoiLIwW4XRZNk+Zzk6mzODoZ/zIiuYDRAaGz1yCDuNzmPJ9pBBla6OxCTigjT5T9OhzO
	ZVMKvQnif4N7GvrysUCp4/NtSb32SgmUzE8T6J/n7yC+a1wdwEHlfH2n
X-Received: by 2002:a05:6214:19c8:b0:892:66bb:fdbb with SMTP id
 6a1803df08f44-894904b5044mr98724906d6.23.1769289077093; Sat, 24 Jan 2026
 13:11:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124102042.112101-1-enelsonmoore@gmail.com> <aXTHhI710LK1EsTG@smile.fi.intel.com>
In-Reply-To: <aXTHhI710LK1EsTG@smile.fi.intel.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 24 Jan 2026 13:11:06 -0800
X-Gm-Features: AZwV_Qjo5OttDk4_JH7C9yZYSHf7L5itJ9UGsDGOS0KJi77gP4CJVRASoAKFFVk
Message-ID: <CADkSEUjwCmowmo_AwZ7TNS2gDt0CLz6buvfjjXz7BrLfuokM4Q@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] net: usb: remove unnecessary get_drvinfo code
 and driver versions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Petko Manolov <petkan@nucleusys.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Oliver Neukum <oneukum@suse.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Deepanshu Kartikey <kartikey406@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Max Schulze <max.schulze@online.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
	Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32680-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,korsgaard.com,nucleusys.com,shawell.net,microchip.com,fintech.ru,suse.com,piap.pl,gmail.com,pengutronix.de,online.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: EBF3E7F039
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 5:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> There are three problems with this version:
> 1) you haven't taken my tag, why?
> 2) there is no changelog to understand what's going on;
> 3) the v2 was sent too quickly (usually should be 24h+ between the versio=
ns).

Sorry about that. The only change is that I had overlooked smsc[79]5xx
in the original patch because they had a version definition but didn't
use it in get_drvinfo. I will follow these procedures even for trivial
changes in the future.

