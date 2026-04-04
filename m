Return-Path: <linux-usb+bounces-35966-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TwfaJz220Glx/QYAu9opvQ
	(envelope-from <linux-usb+bounces-35966-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 08:57:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1239A2CE
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 08:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB0323026C34
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 06:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7335352C3C;
	Sat,  4 Apr 2026 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYXMqYCh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E842F9998
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 06:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775285816; cv=pass; b=Djxo2qMybqHpx2FYdt0rU7WV047MUdsE09T5WDlwzkCD7iNi+OvMfyNio41M6xcqx7EEMHJHqGM9QmVzsKRLHh9KnzBZM28P5C6t8Y/H480FjglW/FVeBobAlUuul5Mvd2MFSJMCfxVR8qKPwqmtfLQr53k/pGbknQRcg/4g5j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775285816; c=relaxed/simple;
	bh=1UqMHYmJXo3EadADYx3d4TbVz35I1rkeUVyQjfCiFas=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FQszl0+7k0R0oT0KZvkrEA/RzD+n5nPhY7qpAj/cz/4Mq1g7paCv8ctdP0oPT5IKfRHE3ImU3gBjScLjh6kWyM2cr022l33ISA8s4M5Y2uv1mC0hxNHYUXNO+1MmQ6HS3lGoeDKUs2SuMXm+aFqDwekit0gYagT2OdSioy4Ynjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYXMqYCh; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a46ebe2beso23943217b3.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 23:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775285812; cv=none;
        d=google.com; s=arc-20240605;
        b=D19GwHQ/mDUv4lnBFuKsjpKMcHLw0j50wwfyskSYUr7iy6eUGmo7mpPD0lORI+2eA7
         YrHj3d4uOgtWTgJtvqQwzECYmPoFdKDvZMccDZL5h9u627fQQ7+HQb7OIM7o9crcWkyI
         t0VWdDQ2YccHkXbt2Qaif9szauUdCfRH89kAW6siGSQTM9jq2qKZEfyoH3c/K0sVbF0i
         9ICDy8YgLdncuSb6qaD9sNip2IMad6Rf2YWDWZXhQU7jMVP020Ybi+AYCwDY1YN1NTvo
         XeI8x+LelHNefrCJhmRM72JQwL6M/nomB3AKLXtV9Tl5MCjyuIBy8BVF75finmPppCJx
         e08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1UqMHYmJXo3EadADYx3d4TbVz35I1rkeUVyQjfCiFas=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=h0y9v2on1LVzTieOOLeIOdgQQC8y32dr2z7Y0i+v/jB6FH0qcR6BfHqtchWhuHuuzc
         mVBEhYCW4T1TrwYMYxF0mbBt2bCZPch077n+h/6qe2B1R2MQyKzZ5/hL6EfR64UPx16S
         J2cWHIchjAVYnQC3Mgzz6BwqgwFejzR0b1gJunhcE5KHYh+DMRPgrjvJ/vzhUdjgNJ3b
         E2JgDekPnqsStXQXpjLnkyT2qYpGCHmdGPT02TodJSgjm974/JDA104dBtYKqQx8exlA
         n6iTh6E5YLxhweQuEyRPCbCkuxZdhA4/YLpxGgAbzr7GxOyOREY5WViu3cO8HA1I6UIg
         XHGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775285812; x=1775890612; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1UqMHYmJXo3EadADYx3d4TbVz35I1rkeUVyQjfCiFas=;
        b=sYXMqYChWdMtV9fDMLYoi9puNTEZyVNpM4oazBauvI3/RRvAeH3T6ZvCimyvxuCCib
         FOrtqXqbM1lNrLl56QFc9SUpstMQ/QdWVBHPIRhKcK4e3mh/gCUfmMe5gVAy5bCPm3AY
         M+o/4Q4+W2ugVpTC349pMi+HON/p598h3DMtUpNvewAlV76eX51Gk0vOYsXjwGH25+8n
         17UyHMaAH2QkEENlsORLMSV+GJoFlNjz2gOtXVs+p/GODCY7IbrzYpyKL2NQ/czDkcJQ
         1Ewh8JyNIYYUPLRPmPqdB+SRuwnquIq+++x84WBQCMvUn6nu4JHwsULPMd8WuKH/bgEV
         VD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775285812; x=1775890612;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UqMHYmJXo3EadADYx3d4TbVz35I1rkeUVyQjfCiFas=;
        b=NjzELTBsgp8A2W9O+1ZcodJGdWgrE6bjTAxzvslrWkzvUqdKTQN7inmeYl7t8QvtzU
         UYojX5hTkY19yFBQhO7Qaw5zRM8+HlXGilcG9V60E0F/aKYCWdgc8uoj6s2zW6tU0pxs
         kbgZgVN8XXaWqCqUlShR1nLX7PpGJUBHp7Ynu6N+pL3HhHd7EhNK+LQunbDnRUoTwWLW
         JiHFjDsqwbo3fMbj9eencx43g+SxhkX5ttvMCIJQMBVIq0jr5RsLxYUTlRB2HcV/WJjY
         VV198rK5Vztoy056o5mTcIna6ZzVYlLgqPgU2YRXOeT5pdX2dUuJGwlR2H2neIfcoqFQ
         VhbQ==
X-Gm-Message-State: AOJu0YyA0tvtguLXhTbCQU3GAvJuDQ1GGn35TDJjB7oGLCXlvi2E7buO
	hR0itwYiKAlVEKU/Z8BtU3TEoQ2hsGJQ4Kem9D0dDyOw3hMaISAIgOXw3XdEvf5LyBFxsOGos9v
	jGZEoThpZwzcNLhfN1C6SdVHsTnfe39Xy2g==
X-Gm-Gg: AeBDievirse51oTmZfnIFeIELexu2x6zZEO8xHvi4dwyrbvauYD4BFjsFErbKnemBlH
	PppBNCeT6gYQVvgnAfNYp/5e4P+PuvcFa77pHqXIhqalAdueKjRo+xBvt+74tENkhPT2ZSZEzOu
	Sl6pN+gMC/N5dc//ukwxIs9HLazdRACnp9udUlETBCStOCBdyuX/SZVCsuXyrVZJKpRCdsR6y9N
	BFne+o4Vs3WFs0BRL05lttVa1j/qCaozvN+fzGn3BU8XrNvnvZuk6DPxkqG82wuyba5OYvQ3TUY
	9syI8rs=
X-Received: by 2002:a05:690c:38a:b0:79a:7cff:7b81 with SMTP id
 00721157ae682-7a4d556cdf1mr59489987b3.27.1775285811679; Fri, 03 Apr 2026
 23:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Sat, 4 Apr 2026 12:26:35 +0530
X-Gm-Features: AQROBzBFFJG3pNPfdo1IBk2_EkeXBsxe7BVPAyI9PeDhoa7A8j6jsjDAMmd1SyA
Message-ID: <CAHP4M8XXQAsOzJFvCwXB=BPN4tdoh5wyn+ZFFmJZPZq5BorxOQ@mail.gmail.com>
Subject: Some queries on eHCI/xHCI/Thunderbolt and dwc2/dwc3
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35966-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajaygargnsit@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1E1239A2CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi everyone.

I have been gaining an architectural understanding on how host/gadget
usb-drivers inter-operate with USB-2 / USB-3 / USB-4 (host-side) and
synopsys-DWC controllers (gadget-side).

Following have been my understandings :

a)
For host-side, eHCI does not require / use dwc2, but xHCI mandatorily
needs dwc3.

Am I correct?

If yes, how is hardware-specific actions taken care by eHCI alone
(since eHCI is hardware-agnostic)?
Is it that USB-2 PHY-registers are already a part of eHCI
MMIO-registers themselves (thus not requiring any hardware-specific
actions on the PHY side)?

b)
For host-side, does thunderbolt driver require any of dwc3 / upcoming-dwc4?

c)
For gadget-side, dwc2 and dwc3 are enough for USB-2 / USB-3.
Am I correct?

d)
For gadget-side, would USB-4 require an upcoming-dwc4? Or will dwc3 be
modified? Or is there another plan in the pipeline?


Will be grateful for light on the above from kernel/synopsys experts :)
Many thanks in advance !

Thanks and Regards,
Ajay

