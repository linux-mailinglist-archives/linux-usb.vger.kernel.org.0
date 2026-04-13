Return-Path: <linux-usb+bounces-36185-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP1RKBOr3GlfVAkAu9opvQ
	(envelope-from <linux-usb+bounces-36185-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:36:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7D3E9314
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 118D43006687
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 08:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113C23AA19D;
	Mon, 13 Apr 2026 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JJ4zPFvI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD513A784B
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069390; cv=none; b=jPUg3PLuv976BAku/NRKBxCurwKjf1RfVSkmcRjSzVkPElFRLLOrRLqQP4nmSMdB2MX7AnQVngAIvW2ThCYU9ByLXD8bTjgVdpssAGvS4uTTE7TBAKbEPpAUwiWhNTzxgVFAXb14xT6yQeUmwvO9PBXI3dFcNZgAJDWGF5TxNks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069390; c=relaxed/simple;
	bh=nIKY431RfJGmjy1wUPAZqvNxs88uGqMwZodeeQhUTP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8rCgoARYQ2uMd1Ku35eL2M1jWpyyS6IMuPhvlk1yE6ecwYS6B1seE/X72jDit6VsZreLtWwPzYgZPt9E+uInHti/oDIH9+HaaVYdJ9XPhaV0rdXb1wRwXp1GoIWclCjEIvxzlGLMcM7BYAL3CuX/pJreswBYMactfvsCQptu5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JJ4zPFvI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso2594581f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776069387; x=1776674187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4iEtYb144WUkeF3avCGkP+wtgzyfR1UboPNXWxw2Zw=;
        b=JJ4zPFvI1LIQjzG+ig2YhTva8RLk+fUvoTJb6pkVp9q0+v2Srtt3+EmcGSabreRo94
         qRescRHHRAM0Ady3gW3INGWH1At7g7XQqQs2eaH7urImNXgQ1bLzDzdqhASyQeFe+T7w
         EuO3WkdkEXkRnPIm27M4jSSHK4LPoGQaMIm+QaBqZXyWsdITAj+gYQTXJfxMkiv1d9Vv
         sUe4kAfh2YFqUkTEI/Gd/PHokwF3NgUX1IKfE823uSbUcEMhG4HE2c3lG8HMupoGYui9
         VeTf/RsePOMgHI08CiFGpSK40i3us90hry09mHT/yn5LASppPiTHdrT2IY/oTPn/3bNw
         RlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069387; x=1776674187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4iEtYb144WUkeF3avCGkP+wtgzyfR1UboPNXWxw2Zw=;
        b=ZJgmqadKCx5LCUnxtmNNyTvI+BB9yfOL4eUhQ1sT5ate4lCJWC8BLGT2NpfrHGtsot
         p42UfvwNsshc/5x3aFP58tdSbNOwyMT2j4zUpfrc/eeQQmBk8z3lyYhcoDXLTF1Dj9mV
         pVpgN/LtzAhCRZa1R32Ag7F/ifmHOVbwqjyBxtG3sAC/5uo632fAnKqR47Ko93RlLWAM
         wMQVngH/ir0akoNJqDvyipN9XsGwO85wUob66KXQM2Qc9Ffp1l6whrnDSUSOd0CzxgKR
         FS4H+9qvsaymN08ElbGncH/ejk/mjiKrebhMTqJrrS5kjPHUiCFCtfNVIfMtnCKABPqj
         nXWw==
X-Forwarded-Encrypted: i=1; AFNElJ9NiAB88/EALUPgPSmgNfpl3S0bQuvm6+cMM3bttHSg9Jrvz8wqrj9Jvws+3Z6cjJbWYzx+SbbvNY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrWK9VJfaewLDzAEE9SbaDO9fxhQF1CKItUhVyQLH7UBJgWXSR
	WVMJ5W2lyxFniXj4TTsEpRppVGQP/0N21Mj6pecvdA01oIZ93RNpazA5I7C6ku9Tq7Q=
X-Gm-Gg: AeBDiessXCIDWhMl1sg13sSZV63/Uo7OOBM4Pr3jHRiYDJRkaxhoMbOedJZjPV4WbxK
	xXEP8zi+ebSyFrRxUT7BXox4YWIMroFzkP1fmshPglxL92+R9O+IkXhqh1Upn6Gt+elXlOeLj+z
	VcvEDcbfMgcJkZJpyDmy1MdZsI24SqbNpzYA3qBlIhhxBfoM6JLvPRDZh8nyjK00YGctHGALJB/
	aJZmuMJ1TzW7uJ2dE30PvBpgqNmRGUD9d+05bFp8zJrR1J2CZ832pfTOaL61gXMJXa51pmgbpu7
	8QF7ASXueIMwjx0wo7F7p6DMmBzgHrgKkwqCUMiNyl+ctJ7RpcSvuRUgGRMrJaaKTjSvPwYnuZg
	B5oLpgd+DuOZPoZ7OCkfoAbWR/nlNfB80XvrAqRR1a25H2+OIUGt55TO9E1K0EGH5VnRutFaeXK
	F781lK7mOz0Znip2Y4CKv0A37SBqnzOi7SSP/PE7S0Rgay5yFANGL9/kRi/u6jG+ABGQ2E+dWnA
	jzU
X-Received: by 2002:a5d:5f92:0:b0:43b:60f7:2283 with SMTP id ffacd0b85a97d-43d64289753mr17732019f8f.22.1776069387432;
        Mon, 13 Apr 2026 01:36:27 -0700 (PDT)
Received: from ?IPV6:2001:a61:1301:4901:b3c3:e8ee:625f:648c? ([2001:a61:1301:4901:b3c3:e8ee:625f:648c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46713sm32071248f8f.21.2026.04.13.01.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:36:27 -0700 (PDT)
Message-ID: <2a6963c8-4a87-4fed-b875-d46f3ce53e42@suse.com>
Date: Mon, 13 Apr 2026 10:36:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: usb: cdc_ncm: reject negative chained NDP
 offsets
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 stable <stable@kernel.org>
References: <2026041137-comfy-eaten-a1ed@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026041137-comfy-eaten-a1ed@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,sto.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-36185-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44B7D3E9314
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 11.04.26 12:53, Greg Kroah-Hartman wrote:
> cdc_ncm_rx_fixup() reads dwNextNdpIndex from each NDP32 to chain to the
> next one.  The 32-bit value from the device is stored into the signed
> int ndpoffset so that means values with the high bit set become

Well, then isn't the problem rather that you should not store an
unsigned value in a signed variable?

	Regards
		Oliver


