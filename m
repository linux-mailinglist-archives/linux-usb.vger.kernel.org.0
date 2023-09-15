Return-Path: <linux-usb+bounces-170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025057A2782
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 21:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E2C2823F2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 19:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7D81B26C;
	Fri, 15 Sep 2023 19:58:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01A15487
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 19:58:20 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44A72111
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:58:19 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68fb5bd8f02so2471749b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694807899; x=1695412699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmHM4psXavgvDfuezLrO35so+CBMe74SVmqgDqqj+X4=;
        b=XeTzfUDcCXCFkZBfDf1AQF1x3mA8sIj7CHRxo04V9HYErUCdABgWjOXgMTIJq8NWoY
         7wFuMr9NS1ajAdoiegiAhtKqDxNzhZuOk+Gzbhm6eNS6sVhiQ0NVGQSAMQtOaxDyseNS
         C0t2IrM0pFi6lb3yQ8JB4dE73FqdW8j7RUNkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694807899; x=1695412699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmHM4psXavgvDfuezLrO35so+CBMe74SVmqgDqqj+X4=;
        b=l4jAH6H8Fd1mVS1557vCV/3gXs3F74g3TsjutBPbapvYYIFKa8CxMAHdOii0IheqC9
         Y6j2xeOjCgt2KKo6DtdVEpxMxvgoUmOiZ2Q4oRxoWSyYF2Pz7pJ7394RaqbgsFvhgbW9
         SGQwGSuOzmYB7CDhIWzd/xXjz1K3dDT/Gvyf2295Jb72qhE5daeL/IzPmn1HCMdRD8B/
         VMkN+jSOnzcD5jctr2rEJXiqss/nrOt18KIFbgWZNnW/koGtEx8/YjsoebUO7umvrjI9
         tmLsIAxKoLGoYqmGcnB+xx5wHMvb+iisV7goSayszYCVWV7tcdNYbJ1fbe0j2WkZxKPq
         7i4Q==
X-Gm-Message-State: AOJu0YxwXDIGF//V+DmNDoX48LRS7HX+VOghRpuU/6cucASXinilr6Yd
	URy+wF4OtZTGkipDe5OCU9L7Qg==
X-Google-Smtp-Source: AGHT+IHxg8lMUhQbD1ACheTV/Mn8ZmyK6E+Zn7O25oxU88CnFr5Q2FqS0QAIFWE5fO7vBsi6A8ggvA==
X-Received: by 2002:a05:6a21:819e:b0:156:dc22:96a6 with SMTP id pd30-20020a056a21819e00b00156dc2296a6mr2747617pzb.55.1694807899302;
        Fri, 15 Sep 2023 12:58:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s12-20020a62e70c000000b0068e4c5a4f3esm3314766pfh.71.2023.09.15.12.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:58:18 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] usb: Annotate struct urb_priv with __counted_by
Date: Fri, 15 Sep 2023 12:58:16 -0700
Message-Id: <20230915195812.never.371-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=keescook@chromium.org;
 h=from:subject:message-id; bh=/nlnwk1swWCmCy2+Sv6muF6tU55a2t3bsLZzpmMZ7jA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLdYB58rdkB52xPa44fGOBHqVRz7lxkY6R3VI
 m+mHExbT+qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS3WAAKCRCJcvTf3G3A
 JmBcEACKNUOge0/I+8iiOTctI4cFdZB/+rB9Ls9SMAQ3HTYKIXbFV6eJFbPrC5AAdAGdsGyVCJH
 8DDCbKRazcLtk/2vGPm6G5nR2FlXm/Rc/JndCygWsLpIsgWs9NMtm1QZlN2rag2TywAY5O66Pdn
 e6RWMDqHtBpjC8irzQ0bHTjkCF4IFlDefPhNEJFeuB9xZVfCsjs45uuDLMM2DL9DmxDIR9TztgP
 aEEPH9ULbxtxiUGrldBOLZpYAS6RnlApwMLXomqII99vwWZEXdECUAWH/AMjYlGDmeuuZdeCGM2
 zfYbE44jcYqSKf2LHciFpDQOTXbr9CLIIUlc7UbO+S45hQONplJEJIPy8E/l2vq+7tCcVJTcslf
 vI7T7sGBuhZljTfaxI4E5EuKBMRLeO9Rna/e/MMp7lHnVerLm8cGrFa5+l+bcvTBsjFSozCuqsU
 Xqan6V+WOLZxOz96eqfXe/e7Il1H1AgAhJy+btd3mtJMRKNEm1TzihpBWwcJ7SESPCQYwGFkeIg
 iAws1DwbSOAIMRq0+yQ3wKSzcD+s2STzCWxnT71yFB1hSthlwFilQIvNlAkhUoEU5HNoO7arF5q
 mB6ZLScLXIEtDto8BDzvd/u7lfKIBnlFXEvMEkB46kXMRcjHBaNclSDin1SO3xY9Mo0CchESmZP
 15qunaB jCdEo3fQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct urb_priv.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/host/ohci.h | 2 +-
 drivers/usb/host/xhci.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci.h b/drivers/usb/host/ohci.h
index aac6285b37f8..1aba22784e05 100644
--- a/drivers/usb/host/ohci.h
+++ b/drivers/usb/host/ohci.h
@@ -337,7 +337,7 @@ typedef struct urb_priv {
 	u16			length;		// # tds in this request
 	u16			td_cnt;		// tds already serviced
 	struct list_head	pending;
-	struct td		*td[];		// all TDs in this request
+	struct td		*td[] __counted_by(length); // all TDs in this request
 
 } urb_priv_t;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7e282b4522c0..2f21c3a8565c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1666,7 +1666,7 @@ struct xhci_scratchpad {
 struct urb_priv {
 	int	num_tds;
 	int	num_tds_done;
-	struct	xhci_td	td[];
+	struct	xhci_td	td[] __counted_by(num_tds);
 };
 
 /*
-- 
2.34.1


