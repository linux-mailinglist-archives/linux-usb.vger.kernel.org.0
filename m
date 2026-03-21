Return-Path: <linux-usb+bounces-35276-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDnTGBz4vmnmmgMAu9opvQ
	(envelope-from <linux-usb+bounces-35276-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 20:57:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 040682E715D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 20:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B57330071E1
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 19:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B13035F176;
	Sat, 21 Mar 2026 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o82YPimU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FC35AC16
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774123030; cv=none; b=bHNF7hUfkg9KECS0KL6VPhOtVClqepyqF5sxGe7uIypyYKCvxhY/V+yWOW5qQDG8N60frZ4fg8B/lxw5GMYQIzl6ugzyhJ9UVwP/a+7ycl5SDGuKNEtHXccO/t9n0XodGfMrdXvaiDUKfims9loULEKiUoTPn6MYR0hS44POT8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774123030; c=relaxed/simple;
	bh=6+k+E1vTFoCa0tawp3RExkgVqSi6qTqO+2Z700v34t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEv7qWqc4o/lSo1YULek4bEg4/VNUL3t/k7FWOQFw+8ooSv0vtWTLSlpKlAfGg5X9tJXV/IYFNXFoWmxexkLvUYoTPbcTCr1CWo9cnQs/sbfdQ4J30TcFse8Mg1zIP9ViRus+/atDziU+VfgKeLbDoALkl13wpb4lxTnsdgMhb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o82YPimU; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cfc1aced74so253387085a.2
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774123028; x=1774727828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVMNxkIfKzuT+eIT1AEccX2jGV9VfbLq1NKhm9uoWtU=;
        b=o82YPimUpI1n5pXNMYQgIvPEn1zymyWNvnRfgP85QAXjQkPfeUxkdmlwt9rPfcV/4Z
         46h9aKIjkM3uw0XGAe8RLhy7Y6nKBosCiKWXuX2o3wx+sDzYEZ+KGS16/x8tB1zxTIqb
         txrMQLyoPEcerlbtoOXx5eBBiWvnoKRgALoQgwFCs7y2jGnQGHXA2w7io32HmkOpK8Av
         TGpnh0Y6GMcI+OBoON5C9KD6xjbc38tbAK2o1VlnyIornEZ10GP6hJW+QwE872zqQbYa
         RKEfX8eIz7gwQ3uE52soMUaf9KsNUh5HAJDBDBHCIaiec2AdhXwl8MlUoBU/lvr5LjHN
         5CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774123028; x=1774727828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVMNxkIfKzuT+eIT1AEccX2jGV9VfbLq1NKhm9uoWtU=;
        b=Ea0kCeoNmatoP+JyGP3Igdy6UKRrA9IohCUCexjo7rfpArlr5YNRMNkKDq9Pc1eedC
         9IS7DveAj/WzcszBu0WMSHPzy3quLHn2qp5l/2T13Dsehew7oN3UsejGo8BGQ/bfNrg3
         1of/xxU4lyVT5z5XIVm+K+L2YfM1nnRj3gGubMJqj5beWJsKxZVDHqrLI3E2Rq+sAIJ6
         YHFyYZAH0SRiIxLbSKP/Ni2HIKPsjymptSTSR/OMGJ/ZiYOBTgxP3jFt0RKYchOdBY3q
         gORVXGYPvrOP0ttnuBTD12PhuYmOXb+iIl7WUnHnRK8OKd6kHEmrlNHj9pCPbLYm72HT
         wEEg==
X-Gm-Message-State: AOJu0Yzz/CoCcPhI6SlT29EA7mVjsO/KO34Go1AnvhqHsFcgYq4iMeY2
	wU4ZjirlXU50ZB9GNCEJ0+4pIiWBUUaYrCEdD/+Ze8IbIoSz7wsM+rCBCOX0q36pYdpXEXZwCtN
	VivQ=
X-Gm-Gg: ATEYQzxuo3TFLhaP62PHKrZ/YP5S+UeNno8Dzv1L4A7izm1ayLd/LiW+/jyLea5yiBw
	yBN/hB7QwhGjWgbHIoS14UZilhaUCbSJGbs7+rhG/OsiqWomfl8PHFCEeIZAZhwy6OH1TljjxbJ
	1q+Z62twhV4h6xLSUy4HmrDR2hu8K4DW/P7LXhirfsZkXIL8ZE9qJmhKZ1ah+GATszEM7DPPoMR
	iOL2tCHq/IE1jUuJ//nAFTxyS4/3HWpJ4JNoYGvMK50Ln22zqwxf0YNFuiXsuxq0NEZM0mK/JVk
	w81aVNDppTegCrwYm7RL/g2zK4/p9s9boraxPrPdCfDOq2MgnKCxJbuaNBkTybBKujfkSOD3FtH
	NTIJpNgXxUCbi8BTdde4/2iotojWab7/vBa44EyU6jPj34m9jbk8U+BwFhyVRT6ElQXBp+Gf+KC
	KG/d0/hSoqYgGkoGEVm0D3520=
X-Received: by 2002:a05:622a:44e:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b4ec8afeemr30667201cf.16.1774123028500;
        Sat, 21 Mar 2026 12:57:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::b00])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e352f7sm46500701cf.16.2026.03.21.12.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 12:57:07 -0700 (PDT)
Date: Sat, 21 Mar 2026 15:57:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mark Harmstone <maharmstone@fb.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: hub problems on high CPU load
Message-ID: <f80e5a6a-3caa-4579-b6c0-f5cbbb964302@rowland.harvard.edu>
References: <2303186b-1555-4796-8bcf-8b95adab4bc2@fb.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2303186b-1555-4796-8bcf-8b95adab4bc2@fb.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35276-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 040682E715D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:32:32PM +0000, Mark Harmstone wrote:
> Hi all,
> 
> I have a monitor with an inbuilt KVM switch - it has USB ports into which my
> mouse and keyboard are plugged in, and appears to the host as a USB hub.
> 
> Twice today I've been working on my laptop with my desktop running Gentoo
> doing "emerge qtwebengine" in the background, and when I've gone to switch
> back the mouse and keyboard don't work. The first time I rebooted, but the
> second time I unplugged the hub and plugged it back in and it seems to have
> fixed it.
> 
> This is on 6.19.0, I don't recall anything similar happening on previous
> kernels. I think it's high CPU load rather than an OOM as there's nothing in
> the log about anything being killed.

If you're sure that the problems started happening with 6.19.0,
perhaps you can do a bisection between it and 6.18.0 to find out which
change to the kernel was responsible.

Alan Stern

