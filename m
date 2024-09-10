Return-Path: <linux-usb+bounces-14897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4B9735F7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FBEC285C79
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2741B18C340;
	Tue, 10 Sep 2024 11:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9BbItTU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20C183CB0
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966761; cv=none; b=IBJD6B1YMAI5WVTDoveU+c3KDqHfb7pGXinltfiWcsap5pJSn+D/P11uzilrVl9HWQ4sLmuYKgmHriZjOvcrTIu/T1H2vunD8Osp64NZDkpuhN8o5Q1GM2FX+B7DakHoVzUNcBpTFRhV+A0Plv5cLJJaQOLlpkRn9hTdLxPRofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966761; c=relaxed/simple;
	bh=rj1O0blrQnUnz1ynSx1EPAPB3z8ZJmOlur+Jihsr5AE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=slui2yeLpPGZc0aUPJX9kIWh059GLUDdu5ceZCU9o+HqASG7RBUGLo9ipsNlJbhvJcvvQPnboqIAQMM3YQ9ymNCfvvtz6uMkEudEZc7dFqT8r2HvUmNyDu/JaluEwrzRrxLGqwc0or7ABHGmPpd4aoZ9OwEwF7j4zeFy7D57108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9BbItTU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so809405866b.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725966758; x=1726571558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UFY9ODv0QXRsu/qyayHFb0ikZEf3AtplUP28DzO2MVM=;
        b=H9BbItTUN5KXIBfsX/3LkImSa/UiJYnOmz9Wm9yXDF+LmmqO1qlsRSRys++2guzZA+
         RyyQqoCodYTQ9zOMyezqJCMJ1fFNwe9spPDGSJqOtoDk4KoetqT3iZBtnMFQ2QAIZ+5A
         rygoJFlh4qTDA+TmTJ5rax1c13a+iSJF1mEJEdBScImQ/ZKTc7KyHPC6YKOYb8E2WjLq
         fwAuAbAabkaPZWX67MDnAk8okgKEZ+j1gQxpltC/+TtFTzB/6PVRreq/fdwX5hNCPMOo
         E7nVhQUQ7buytBQVoUQc1Zi080q2qEuxHmKAlQ15G9BA93paG5+AKBk5kk0GH+qQwQYT
         Ls+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725966758; x=1726571558;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFY9ODv0QXRsu/qyayHFb0ikZEf3AtplUP28DzO2MVM=;
        b=K10xXgSYA/ucEIPhMEjaxXlzUrFjP3xWZ6M4vUpmvfAERcDZoSoO2ToT77VVyPfLp/
         ledMMFm8/PxsRxldFfV0HS7QA0AErbJneRf+/V67LI6198bu4PWhG24lCE8OVMpwzU1c
         vYI1uZdJRQoNwRREtdBFQSossUconz4ctdIYJlpo6YVwpRg59XvSNry6gaUlERt7UwtU
         tCiPAN4y3oMl8sIkssgsLv/cIhp1N4o2TVg2CR+jtp2P63gXMgmprmxsPJJyiboD6p8Z
         OlIBUclIdzIPt1dex9hoqTRT+fbLhE+H9rtxMydR5287XKXKDGrkKIbUtobzX6pRxI8P
         PIug==
X-Gm-Message-State: AOJu0YyG3R99yuknuJEt6mj+HlJR1/z6boRSTHGs1BApAfMMDiiKP5Cg
	zfVarLnYtWgfz9CbPXWLciNbiC2CGHgfCbeRk0RpoFd6GBoaLcy+
X-Google-Smtp-Source: AGHT+IH3PlPVH6pwOAP9GDRLkNMWGaOCh3eESdRll7b8DRwWBGq4vX0Cq4uvU/43+zimu5xmsDTdNw==
X-Received: by 2002:a17:907:1c12:b0:a8d:2afc:c06a with SMTP id a640c23a62f3a-a8ffb24439cmr33139666b.19.1725966758065;
        Tue, 10 Sep 2024 04:12:38 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d2593c9a5sm466476166b.52.2024.09.10.04.12.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 04:12:37 -0700 (PDT)
Date: Tue, 10 Sep 2024 13:12:33 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 0/5] Quick and effective handle_tx_event() cleanup
Message-ID: <20240910131233.409c6481@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I mentioned that I came up with a simple way to clean up the messy
(and buggy) event handling loop. Here are the patches.

Total line count is reduced by 26 and the sole loop remaining has no
breaks or continues and 8 lines of code. Some functionally duplicate
code is merged into one path. No functional change besides bugfixes.

Six defects identified by code review are resolved along the way.
I successfully reproduced #1, and #4 was seen in the wild on linux-usb.

1. Error mid TD followed by Missed Service is misreported as missed.
2. If EP stops on the next TD after error-mid-TD, neither TD is handled.
3. Empty list quiety ignored after short TD on hosts without the quirk.
4. Emergency stall recovery not attempted after "TRB not part of TD".
5. A race could prematurely complete a TD after an isoch ring underrun.
6. Error-mid-TD transfer on buggy HC is stuck forever if it's the last.

Debugging of TD skipping is improved - we know if/how many TDs were
skipped, in addition to whether a match was found or not. This enables
quickly catching cases when suspiciously many TDs are skipped (I have
seen a case of 150 skipped TDs, turned out to be a HW bug.)

The event handling process becomes linear - check a condition, handle
something, check for another condition, handle it, and so on. This is
much easier to reason about and to modify.

To demonstrate this point, patch 5/5 fixes a pair of stupid issues by
inserting one check, which would be duplicated 3 times before cleanup.

This series should be a good base for future work to resolve remaining
bugs. For example, the skipping loop could change from (simplified):

    while (td && !trb_in_td(td, ep_trb_dma))
to
    while (td && trb_after_td(td, ep_trb))

subject to providing a working implementation of trb_after_td(). I have
tested three implementations, some based on pre-scanning the list and
some on direct comparison, but I'm not 100% happy with any so far.

Mathias had a clever idea to use ring segment numbers for this. I tried
and it compiled and worked flawlessly on the first go, but it requires
passing all those seg pointers and total ring size around. This happens
to complicate sharing implementation with trb_in_td(), because users of
the latter don't currently provide such information. And I would like
to share implementation of these functions, as they are very similar.

Regards,
Michal

