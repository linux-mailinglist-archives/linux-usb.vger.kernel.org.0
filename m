Return-Path: <linux-usb+bounces-35349-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHEyOMmzwWnlUgQAu9opvQ
	(envelope-from <linux-usb+bounces-35349-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 22:42:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A472FDE2B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 22:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10113304A4C8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 21:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C2537F007;
	Mon, 23 Mar 2026 21:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM/NBGP1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39B637DE9F
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302056; cv=none; b=FXd3vrzSWQZ+MLZdrTUV6egmYt5nG25QJBi8oIzwLbxD+AKoHga39c87nPWJsnaUJFBg80UrBeecbIvf/xOFHwalJxG/TJNNIzf52zuTY1hrtJts07AZd7thVRAKvpww+PZ0o1oDzQXXXAQBugdtlwojeL4l/0uRblyjT4dr2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302056; c=relaxed/simple;
	bh=PyGsXxwBLAbx0pkRlKrTWfssNHt0Fqjuwy/lrB2CQdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSdlTWcoDmZBN8XZQeaQ58iZFmmE4EPoNhvxb4rfUbBalkXQ4IgImK2AoGemC07MjHQWgMXYIApoQi2mtfMOysjbrjQJL6d/u0a34w5ykrxJlnin4X7bp+QunxLmyWpBLowkE3iAKU1Nx9wsJwXWEklEVJq/Fb/zrMLMsWe6NgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM/NBGP1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b982d56dac4so109880366b.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 14:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774302053; x=1774906853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPpefVkYLkq2RrZMkVrdiEsEfY877uoA9IM104OWkz0=;
        b=jM/NBGP1H7xJ6m2ZTOgnMOfxc7irHHnqX4TJ92S2zWZ3RbucN3iKJLd2XiVdiRmbZ1
         U6KoyXnrgei6l32CouFRQlFx0PcLSHUnNaLI6njI2EJzP7SMch6e8xLm3OvcsLgNWI2k
         Kr2j1Si8UY/ZELXDENWHTPomUqeKhO4U+jvH/VAowHPPObToCp8gofLtz1XnJcDVtFOb
         ELZM9HvCVJ8SA8BSd9fC+uQZQ0NQ9HT+aS5WrAgg9AUUxtw/9ML7rmuopeDQAw4aMb9q
         iIYJVmm+RUAx7wZidzaKmgPqLQ6ghfysTnI9qVSI1Bxt88i5czm/mh/oy/ZppbJnhx1t
         Ivxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302053; x=1774906853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPpefVkYLkq2RrZMkVrdiEsEfY877uoA9IM104OWkz0=;
        b=V1SKGN3G25FX6IgSH6HBgD0b0PRG7BVMEQtKl7vcaBrhu/vHo9EKo+YOfdVSBY2Ug7
         CheJC6BdYzQ+Spn3oPO48aRaxgQSfkSth6zDj1KFjQBSpfvmuu8oPMMuitDiOmH8uxzH
         ZdduQTgR+kW5bzcAY/L65unGOwICS3Oj6OtdJ/C9NRsBZVF9oW812BvExdS00Wdjqasd
         d3Qypj8q6vSAcPTzEkEVwgpb7AjvPLC9evcmW5j3v6oc8fPV7Z94igRtPACUbJYLbVoT
         HhYUPA/yiGKIHA//E9xhtjBuYBv6Xr2eyDFqRgLR0yfRZ5s+xsKAQM5W+FqG0nnL4mVg
         348g==
X-Forwarded-Encrypted: i=1; AJvYcCXtMBbtH+Zlgiy8n8+FVPtTqwLj7GTc+QxpJhLTsHMsorWGRqoEV8uItM521OeRNgoQNIyR1sQmmwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBRuqalTBGfAGf9xBBWq3LEcd4ir8bx6QgxSz90XMqC8N2GKkF
	3d7ONOFDgaUuVIwOFImst2Uou5yIhAB+fz76ykr/BhPraxlWCWCKVA9fTTDqoQ==
X-Gm-Gg: ATEYQzwvDS+2oVRBs/yqYoqyepvnLbwU4XlWuMuWWqg7hQoc2E7suaSdBJ5qvYpiSY0
	UTXI/1vCL17SKhMonaLkBWyteRv5LsKwam8ic7uHj0hBwpNL+vWoDlsHMyFnbg1CIgMLt9q5YaE
	YBKOx1dyLFFkmtZWYA+m1uKnlGJe8XzYjskzm+GA8Uiw+UNhVrQWD3dDOjw9dWYcR+tbzUZQbk9
	FWgnFSnSfqoexYW3o7YZpDHdVgLlNswnHxEJO3WWP1baQy9Mh5mg5I6JThlaXlE+G2H6ghizA5p
	3L/18wXq3jsNWAJpQQVxB6HOSZ8Ji0KGe0ubi0zT7Huc1HI4unKz6HQS3p0bqDzSwXOqphFTEv4
	YI3xTBbSL1EH58+4D6EwvREkM8SgdLHUJqwNQ+xZtced0QLC2zxpr4Ckl/pCqW8EXeZXABj+jlv
	onTcMUg4MR0bUDay6U+XHD+CSATgIYX5psFIrThmfaW/0Fxg==
X-Received: by 2002:a17:906:27d7:b0:b98:2641:be5e with SMTP id a640c23a62f3a-b982f399b5amr768393166b.27.1774302052634;
        Mon, 23 Mar 2026 14:40:52 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8da12sm550852666b.21.2026.03.23.14.40.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 23 Mar 2026 14:40:52 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:40:48 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Pavankumar
 Kondeti <quic_pkondeti@quicinc.com>
Subject: Re: [PATCH 1/2] usb: xhci: fix Command Aborting
Message-ID: <20260323224048.14426237.michal.pecio@gmail.com>
In-Reply-To: <9c6625f0-64d1-4f90-ba89-72eb9a153ea1@linux.intel.com>
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
	<20260316142720.1471906-2-niklas.neronin@linux.intel.com>
	<20260321143057.1bf31b1b.michal.pecio@gmail.com>
	<56606a55-b1cb-4669-9025-8a91d8d258bf@linux.intel.com>
	<20260323122458.0af6b4d0.michal.pecio@gmail.com>
	<9c6625f0-64d1-4f90-ba89-72eb9a153ea1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35349-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2A472FDE2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 23 Mar 2026 16:00:54 +0200, Neronin, Niklas wrote:
> The ERDP bit field is 63:4 and can therefore hold any TRB address.

Yes, we don't have truncation problems. But what if the high DWORD
write is delayed enough that some stupid hardware doesn't wait for it
and simply overwrites just the low DWORD and assumes that it now has
the new dequeue pointer?

Not good. But also not likely to matter, it seems we only get in
trouble if the event ring overfills and the HW fails to detect this,
exactly during the short window between the two DWORD writes.

> How I see it; hardware which requires an upper DWORD write will
> "buffer" the lower DWORD and wait for the corresponding upper DWORD
> write.

Hopefully that's what it does, yes.

> However, because the specification states that the CRP and RCS are
> ignored while CRR=1, the lower DWORD write ignores lower CRP bits and
> RCS bit.

Yes, I tried writing only the CA bit and it still works.

> As a result, if the upper DWORD is written after CRR=0, only upper
> CRP bits and RsvdP bits are updated.
> Conversely, if the upper DWORD is written before CRR=0, only RsvdP
> bits are updated.

If high DWORD is written before CRR=0 (current code executing quickly
enough) then nothnig bad happens, or at least nobody complains.

If high DWORD is written after CRR=0, then it's a spec violation (we
should write low before high in the same "transaction") and low DWORD
may become corrupted on some hardware:

# command at fffd4220 completes normally
[  +0,061649] xhci_hcd 0000:00:10.0: handle_cmd_completion cmd_dma fffd4220 cmd_comp_code 1
# command at fffd4230 is aborted and generates Aborted event
[  +5,501058] xhci_hcd 0000:00:10.0: abort took 69464ns
[  +0,000067] xhci_hcd 0000:00:10.0: handle_cmd_completion cmd_dma fffd4230 cmd_comp_code 25
# then the ring stops on the next command as it should
[  +0,000029] xhci_hcd 0000:00:10.0: handle_cmd_completion cmd_dma fffd4240 cmd_comp_code 24
# I wrote 0xdeadbeef after CRR=0, so CRP changes
# lower DWORD is corrupted, it should be fffd4240
[  +0,207941] xhci_hcd 0000:00:10.0: handle_cmd_completion cmd_dma deadbeeffffd4000 cmd_comp_code 5
[  +0,000015] xhci_hcd 0000:00:10.0: ERROR mismatched command completion event
[  +0,000004] xhci_hcd 0000:00:10.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0007 address=0xdeadbeeffffd4000 flags=0x0010]

This happens on NEC and a gen-1 AMD in-CPU xHCI (rumor has it that
AMD licensed this IP core from NEC/Renesas).

On Etron, the out of spec high DWORD write is completely ignored.
But if I wait for CRR=0 and write both DWORDs, then it accepts the
new pointer and IOMMU faults like NEC.

ASM1042 is 32 bit it so it ignores the upper DWORD completely.

ASM1142 first times out waiting for the upper DWORD, then accepts
the upper DWORD and IOMMU faults, without corrupting low DWORD.

ASM3142 fails to complete the abort, even on unpatched kernel.
Not sure what happens here. But this is not a usual case, normally
Address Device times out internally. I reduced command timeout to
500ms to force it to abort.

Regards,
Michal

