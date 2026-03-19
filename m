Return-Path: <linux-usb+bounces-35155-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI7pMd8EvGmurAIAu9opvQ
	(envelope-from <linux-usb+bounces-35155-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:14:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299E2CC821
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 293F931B8F17
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B0B3033E8;
	Thu, 19 Mar 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KaKmziBI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073262EDD45
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929426; cv=none; b=U+CR3HPt37FV6F81ka8cLPybEZZy8FEjHrhmqoC+O75rGSaKCU0bpNS+fwBpMMy2AHgfx/UCET3bC17ZYZMuew9NpMf4x5X8CuHzd2lljGbyjD8g7qarPlrnwuB8vqNF3JvR9vfXrLC3DpLXcz6ze6TBVgXjYHDpSv3paEWkd2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929426; c=relaxed/simple;
	bh=3FpX8OJxqBa8gwdiP9aZE8MdNK+2u1/n4TnG7eZd05Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQnmw6KWcbWoeAFNPkH47iKWVXwpmHwowLkDgcU5HvrLKi8sO+LwUG/yV8xivnbbUnC7XtN/7MOMuhQAqiC8qnayR0elPHDJAjHDPXf5hsZqYt8ex4XiUqTGVdt85DnH2q/yRyKTtC6PTY3M4Rp/XsNKe/PbbMuXdOp2AoU46ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KaKmziBI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486b96760easo10963175e9.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 07:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773929419; x=1774534219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/lUQzaDLX9G5vwASRv/N/w/bLqcMJFq4CzwCojc9sg=;
        b=KaKmziBI/MgMycx7+AtxCqE/M5K7rU4OFi1RHbZH+Xr8M9onenWruaoavVOy/tFQ2v
         t9hY4ZATkNCYW4I60w9j3f1JDg9xt7kqtkiLwbaqIkG7Vcbt13qG1kBoAFQGyKQwAjgW
         boMZ+AkVlxY/6kSgPQ3AoHIR985IRqaP87SFGpPHSi77khHnihO2ndBtTcdIbo2bdcvR
         8ZJ0/FMWCuXgHFCwliBNBkv8XKP/Y2RO+pECQT85WKFFjs7PhW0pRXJJXSsnwd27QF5q
         1dNe8u/cDYzintJW5uPpx/zMCeig76RsmvIRQAv+juHwbDwZFNERJon9dXhg/uZ9Gwo1
         iUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929419; x=1774534219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/lUQzaDLX9G5vwASRv/N/w/bLqcMJFq4CzwCojc9sg=;
        b=okWflpw/1YOTZstT3bAYzJ8fbpC0tl1Vy/ubrEOxDATeNNuPnzF0I1phyJ3+g937sA
         V78JA8n5OlXkjNZqDq9UNVyoJPdU7Nl3vg/s3OrI+74yo78ivA/4XTrcauIzGt0Wud9/
         jgnPn5rlfv2rLKSAYULqvoerZBll6HaJpM0bWcbUP4aR87EvsagAZ/nfcq9KgZ9IZB95
         XFSCf/M1TYvAYH2opaekSPt4zYSQm4NFo6ZGsryezYGf2gk56R2x0PW6jiQgY2Feln53
         Nf5CYRwHuL8B2MFpPOR2Mc2pXDhfcJYbmUK9XojtVDY9XPgX4KMzHJVBmTIoUsoMmMps
         xpYA==
X-Gm-Message-State: AOJu0YzvuzzR8RvPkD8uSnaiOvnmTWSHt3H22bAeyiar9l4rUhOVpmdq
	+h3EdvMsh0nCTlfqTvV3/T9TJZwpm0WaTJz5zcwa/qBDonVMAPGpgYnn+0sIcfulmHewDWTKZ4X
	mtcFI
X-Gm-Gg: ATEYQzyESs/XibmT9EOx34QgZlRamOYFAMNg0QsG4qS5H4z2sHCsE7AgabOJNeVBtPw
	v3zWb8q3CbxFWDDVSDQah/hOD3/029w2Xc9b6ZaU5eQDTL/HSBkO+byg6xdollskJg4dnjdHDSJ
	AaFGLeacfaXQjI5VrRxqfvyvfZ9WmcQEdhGqwwAEwZjEfpP+KONbpj5KUrxhWkFD7b48EVFWoAx
	KeCFFCbohJxkuclMCbjT8vieVzPzDMhCukPCILKBi4WsW1z9axwFCYOfx1OjTlhiGU+qXE2uKKx
	XNxXJ+YZSf2oOkOlE1J/5IkJ96Vyh8l0tQN5sfDMRiYaMcAG6UIxZW9JUtfkGJOuHpXIcfU0t26
	7DGAeEabTPeI6ZdzUdsUB69IXunxl15idW/qqKRRGe+3tqr5QLBG4yGccBRh5Pfw7DE0bOIbyTu
	JpVT+NkXBoQ4GdvjcCOvnhmIxb4+HbOaxCFkn9QBY9CAlEummYVWjzt5NY537vMpHzlA==
X-Received: by 2002:a05:600c:3e8d:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-486f447503emr116225005e9.19.1773929419281;
        Thu, 19 Mar 2026 07:10:19 -0700 (PDT)
Received: from ?IPV6:2001:a61:1301:b601:321d:fd64:6ebf:9f7d? ([2001:a61:1301:b601:321d:fd64:6ebf:9f7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f463c9f3sm66438135e9.3.2026.03.19.07.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:10:18 -0700 (PDT)
Message-ID: <34b85317-29aa-440c-88a8-54a454784759@suse.com>
Date: Thu, 19 Mar 2026 15:10:12 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] usb: xhci: stop treating 'wIndex' as a mutable port
 number
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
References: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
 <20260319135626.3077643-2-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260319135626.3077643-2-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-35155-lists,linux-usb=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,sea.lore.kernel.org:server fail];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3299E2CC821
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 19.03.26 14:56, Niklas Neronin wrote:

> @@ -1258,11 +1257,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>   		spin_unlock_irqrestore(&xhci->lock, flags);
>   		return retval;
>   	case GetPortStatus:
> -		if (!portnum1 || portnum1 > max_ports)
> +		portnum = (wIndex & 0xff) - 1;

Should this be a macro like usb_index_to_portnum() or something
similar?

	Regards
		Oliver


