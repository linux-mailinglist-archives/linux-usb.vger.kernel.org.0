Return-Path: <linux-usb+bounces-172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C987A2788
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 22:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1339F281782
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 20:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BD61B277;
	Fri, 15 Sep 2023 19:59:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E911C94
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 19:59:45 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61442134
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:59:41 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c44a25bd0bso2621475ad.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694807981; x=1695412781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QTAaYbGChQLUY+Gq2za7n5ZQvKf3nOru5ieThOaDQg=;
        b=isc2Uoq/XYyn9PkkBGKy5qP6NPWyEYQbN8EYstt+PwKCqEUdunW6rNMEvxBUyI5e4S
         UYMM/jbKgUGyDFZp2hAlfnPFaOn/6Tltpq3FIeNJiYC7woXA1qOyib9CzjWAVQ1BY8pp
         7wh3TXjiLcnXBOcg6LKtDHfqbRwqFrp3U2A6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694807981; x=1695412781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QTAaYbGChQLUY+Gq2za7n5ZQvKf3nOru5ieThOaDQg=;
        b=FIzYpLzpMdE3zu+uuQyj9HDbqcTgXpwWeTBFKslK4w0WkW/0uBFnqMzAcFYJE7adYR
         snHfLynEMpNoNIgGJtA/ShDrWVDjckAlgXU7WkWO96ucVsSvZL4WlBVCcz7EYKFXsUaV
         vp8Ak5G97sWH3WVTCy285TdaYCSh12Y0aIOZ0g+prJJZABoB0wck2jTTdf1hP8b+vrlN
         +oGgIUhE3BHTHet17+NQVBlEA6Mcf5KLrejiZ5N3+Rrwf2RVDcef98Js7nzLe3ZrKRon
         tlaC7xYnCWOJScXdfjbIE7F62JWoO+/XngzaRZvRVjVYv/FnceLlD/Up6CmA/pekmxui
         JFYw==
X-Gm-Message-State: AOJu0YwGGzFhFLUDQF8mQZeuObGbmxph/QB0zBQgnGoXSX6zbA5kqCrU
	W/EKquWZgVCp/omrJBnX8yjUeQ==
X-Google-Smtp-Source: AGHT+IGYK7Py8XcBgcsBTxZTMvjHQKfVzB5OmfXsKXYmjNSdHYAcwM38OH4ue55Hb1gXlpvUJ8KkHA==
X-Received: by 2002:a17:902:684d:b0:1bc:224a:45c2 with SMTP id f13-20020a170902684d00b001bc224a45c2mr6041713pln.15.1694807981241;
        Fri, 15 Sep 2023 12:59:41 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902a40400b001c407fac227sm3855508plq.41.2023.09.15.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:59:40 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	John Keeping <john@keeping.me.uk>,
	Peter Chen <peter.chen@nxp.com>,
	Hulk Robot <hulkci@huawei.com>,
	Allen Pais <allen.lkml@gmail.com>,
	Will McVicker <willmcvicker@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] usb: gadget: f_midi: Annotate struct f_midi with __counted_by
Date: Fri, 15 Sep 2023 12:59:39 -0700
Message-Id: <20230915195938.never.611-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208; i=keescook@chromium.org;
 h=from:subject:message-id; bh=7ll080Ip8+xgpFyr1ptkCSq6rEkEIYaf1ZtwJzLxEFA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLeqiItMEXLkRQ6I0AgJamBwTNeEi20eegnZt
 l84WwSJaiuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS3qgAKCRCJcvTf3G3A
 Jt0FD/4xkc6NwN+7lXbDMSm4p836lNJxBBL+/SGvtbx8Eh9D5gW27FBIx1e3Y+W0R7/CiQnJdvC
 Q0numJF5+tgUVzR5ef5AIRZRrSuQC1OovDPs0lOar9jswym6HioJEY29phkpX8u8B/dQJiazIP4
 OgoHGhaj8mVg/fbTbFi0RfyeScciuvBKdwKTrcL+u2O9Tjbaquwjg0L4J2t+Ka0fFW0yDuzyI4M
 WtPAW1i5V9KEz0XTxGtMfAb966wgcc1cOszoqiNMSb4qro2RjomQLIBffiFL2UVCAHhDvlI0aRU
 RrduhXmOJx0e+KPtPV9mgpJPinw8+MTo55974325aOLst/tii0/RrCvsEnedJK2bqy7COveWb00
 VjG2aP6iHIx2TJ1slgBO+TecF1NeAe9eCOz/s/TkFOSaYfmUVVs3ZJ/5tmjoYzHXQfifjId8O8k
 uxMMrDXmPYIBDXNP8sHd4zMHzHvRdAiL3T7Fh8kI7mPFYdfobFOfVqNA0hYZVf8TxBRv/egZR7t
 k+NrSD3agAofKIDkcP9tEe/EqkDU0PgsMMCOEXysbZlXE87+k/nwnpGzH6hQr55vHTCKUL9L8SE
 zBX5jFgLgc7kB2SpvHWvj9WL1+Kg1t7LcDQvmyAeh4rZkXnSkvDtNhlJUP5LZPS/Bcm29gzBplo
 V2HLJoI /9JPsM2g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct f_midi.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Keeping <john@keeping.me.uk>
Cc: Peter Chen <peter.chen@nxp.com>
Cc: Hulk Robot <hulkci@huawei.com>
Cc: Allen Pais <allen.lkml@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/gadget/function/f_midi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 2d02f25f9597..033e347554db 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -99,7 +99,7 @@ struct f_midi {
 	unsigned int in_last_port;
 	unsigned char free_ref;
 
-	struct gmidi_in_port	in_ports_array[/* in_ports */];
+	struct gmidi_in_port	in_ports_array[] __counted_by(in_ports);
 };
 
 static inline struct f_midi *func_to_midi(struct usb_function *f)
@@ -1349,6 +1349,7 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 		status = -ENOMEM;
 		goto setup_fail;
 	}
+	midi->in_ports = opts->in_ports;
 
 	for (i = 0; i < opts->in_ports; i++)
 		midi->in_ports_array[i].cable = i;
@@ -1359,7 +1360,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 		status = -ENOMEM;
 		goto midi_free;
 	}
-	midi->in_ports = opts->in_ports;
 	midi->out_ports = opts->out_ports;
 	midi->index = opts->index;
 	midi->buflen = opts->buflen;
-- 
2.34.1


