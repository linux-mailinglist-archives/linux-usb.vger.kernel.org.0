Return-Path: <linux-usb+bounces-2376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0287DC566
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 05:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0854B20E62
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 04:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F4C110D;
	Tue, 31 Oct 2023 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JzMzwDj5"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D91636A
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 04:40:29 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB6098
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 21:40:28 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7be940fe1so54452317b3.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 21:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698727227; x=1699332027; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B+4M8qUb5+K1a/FyErFSr70ByarKTZl/dAflxdGEIYs=;
        b=JzMzwDj5rCwDFltmypSuAq/A9ZtimnuGg2cEStD9jOCqE4t+vwow2ZEltyfT/lW7h4
         zgZsfhxNsegXqwIhGmV2ha1Yo3vaeWvr2Cyo3bKaguvr+SJszL61TzIpP0cCRyYJ2Bt0
         3viXEXhHMyI9QYnMvFLw+87DoHlFIzFi0xaHdJCicUHgq6meC2kNQXbGcRu83L9MsvMq
         vO0IWxb1iuwCJbHT63rpnFv1UsrOyIYKVrao1SDrO39dck7XzPanC3wHxNFuDnwN0JSY
         9XrIKQuzssN9+J4fMBoFPpHeLqgfjsTibrealaKVyiT2Gy4CI3lJd8TkcOcFZqkA8yfb
         0Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698727227; x=1699332027;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+4M8qUb5+K1a/FyErFSr70ByarKTZl/dAflxdGEIYs=;
        b=ZyuDVezgZna+x3VuQha4ajDJNfj1WH9a4bezqDVJK+XQdRqy+weo5m6W/8tkVxZ8p7
         OTCVz8OqNDqkG2JRnDdgz4gPDpy7TMd51kb+jpuTg0DV3iH7KuQBMKpc9risbJWqzt8s
         fRz/1IX/soLE54OZEqXzqwIS4yba8kYG2ps3t78F3UZDs4R8ezZ8NBCsJqq5rnmBG9jr
         yMft7vY//GFMTx++KulPw5fxVhpd3pAoxcQE6OD1WDtInUFw7msiHXCsfUoUrbkMF03X
         4MYUvaIfUinRSP3fGzBEsOkVJBuVASmWES/lRpbShq3yQeUtK364VSrFUXzz2W+9LArV
         pfeg==
X-Gm-Message-State: AOJu0YxEa5tT8UPNeCHFPl2549ulymF8hakBEfjP+vU8YkQEf03UCrIH
	B3rchQlz1IVtCEfUaPBjm9oUyHrv6U6F
X-Google-Smtp-Source: AGHT+IFmi1MxN7IGA0HwSD8daE7NbfCukvyuvVk1gsK7/fnUQW91z567nVv1UgqB+zjOJBkLtdh1RavIrgGp
X-Received: from mnkumar0.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:313a])
 (user=mnkumar job=sendgmr) by 2002:a0d:ca12:0:b0:59b:f138:c845 with SMTP id
 m18-20020a0dca12000000b0059bf138c845mr224715ywd.2.1698727227457; Mon, 30 Oct
 2023 21:40:27 -0700 (PDT)
Date: Tue, 31 Oct 2023 04:40:19 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031044021.1162403-1-mnkumar@google.com>
Subject: [PATCH 0/2] Add a quirk in xhci-plat for parent nodes to specify no
 64 bit support
From: Naveen Kumar <mnkumar@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, royluo@google.com, 
	Naveen Kumar M <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Naveen Kumar M <mnkumar@google.com>

This patch aims to expose the XHCI_NO_64BIT_SUPPORT flag to the parent
nodes of xhci for clients to specify if they can not support 64 bit DMA
memory pointers. This issue was observed with a Google SoC that uses
a DWC3 controller where the virtual address's higher order bits are
truncated

Naveen Kumar M (2):
  usb: host: xhci-plat: Add quirk-no-64-bit-support
  dt-bindings: usb: add no-64-bit-support property

 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 drivers/usb/host/xhci-plat.c                        | 3 +++
 2 files changed, 7 insertions(+)

-- 
2.42.0.820.g83a721a137-goog


