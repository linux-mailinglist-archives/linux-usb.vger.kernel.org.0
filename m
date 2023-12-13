Return-Path: <linux-usb+bounces-4116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F08112BB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 14:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E2A1F21524
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 13:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C99F2C87D;
	Wed, 13 Dec 2023 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oq6YiaXY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE814F2
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 05:22:48 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c25973988so70627295e9.2
        for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 05:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702473767; x=1703078567; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jY13RsvR2p7nAVWn/STfQAiQyGaFoi3utwqqvjImNyk=;
        b=Oq6YiaXYzOaamZEp7gALMU85D8UlkkbjER2evO96CvFXabDs7pnBOtC4HMvZK7JnKp
         Ok4KU4DDUffyyGaRepYKa+gAz8W0F4WJAuH5EGKxhgFrQKKi1a3CjqENOjAAf1+J7XlP
         MvnQG6FQgwwTXU/+YPaOVI78XfrMcmsAP5WI4WkIE5yhIa0udduEEikW7NiflFe8+sGi
         3h5JsJApeit2VNth/gMlSUQXyuT6Q5+ugNXZe1AagCvnTFVlRC0jyCLwf/NhtqHrvcoe
         qvUdPOesNmJlCjBn834dDD7vnjp+MIWYUJ3Aa5wAepn6lMVfy/ei2rnx2jks92FzHxXh
         h7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473767; x=1703078567;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jY13RsvR2p7nAVWn/STfQAiQyGaFoi3utwqqvjImNyk=;
        b=MtqoBrScMUGCWeLAFu+RvJkdFXOBbwcZUsYsnHbSK/zfvc0ck62nGeTRG82+LL+ajE
         73ICDq1WIJggrWACWjzurnmmCpJ8QmZaY/gcx0tJhKvka3e1teKdQ2+epQUSk0/1+XZG
         jedEcHG6MAhUwNsIcF+q2Y2bB6VR5v698xYdRIu5qxMpOgyAF5UDWC8Mwq4WTSSKehVY
         3HKnHt9jgSKxR0nrJlTaxhJvY8DK3034FLrtYvtq2iEh5Zmkmk6RfFnRmMPaIMcbGId1
         qqQN02zYzEkmpCT7dToQcKv5WliBATFteXjx71ACqxscnDmAnCxrx/5oSQkI2Iru2my0
         J72g==
X-Gm-Message-State: AOJu0Yyr8rmlJOAK6V3/HXm0wyC958m5z9/WFv2KuNC6izbeirPGA1iK
	0wb2SwukUN28vALGk6tqc+88jg==
X-Google-Smtp-Source: AGHT+IFNIB8ZVVFyMT1ctnUHjs97JWr+gn9ZrulTqN7ITxPsUO3rpI/TAHzPGq9CbL5OwD8wPmSpAw==
X-Received: by 2002:a05:600c:3556:b0:40b:4c54:3d78 with SMTP id i22-20020a05600c355600b0040b4c543d78mr3882194wmq.28.1702473767093;
        Wed, 13 Dec 2023 05:22:47 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id s5-20020a05600c384500b0040b632f31d2sm20693616wmr.5.2023.12.13.05.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:22:46 -0800 (PST)
Date: Wed, 13 Dec 2023 16:22:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] usb: fotg210-hcd: delete an incorrect bounds test
Message-ID: <ZXmwIwHe35wGfgzu@suswa>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Here "temp" is the number of characters that we have written and "size"
is the size of the buffer.  The intent was clearly to say that if we have
written to the end of the buffer then stop.

However, for that to work the comparison should have been done on the
original "size" value instead of the "size -= temp" value.  Not only
will that not trigger when we want to, but there is a small chance that
it will trigger incorrectly before we want it to and we break from the
loop slightly earlier than intended.

This code was recently changed from using snprintf() to scnprintf().  With
snprintf() we likely would have continued looping and passed a negative
size parameter to snprintf().  This would have triggered an annoying
WARN().  Now that we have converted to scnprintf() "size" will never
drop below 1 and there is no real need for this test.  We could change
the condition to "if (temp <= 1) goto done;" but just deleting the test
is cleanest.

Fixes: 7d50195f6c50 ("usb: host: Faraday fotg210-hcd driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Lee Jones <lee@kernel.org>
---
v2: Use the correct Fixes tag.  Add Reviewed-by tags.

 drivers/usb/fotg210/fotg210-hcd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
index b2f8b53cc8ef..8c5aaf860635 100644
--- a/drivers/usb/fotg210/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -426,8 +426,6 @@ static void qh_lines(struct fotg210_hcd *fotg210, struct fotg210_qh *qh,
 				td->urb);
 		size -= temp;
 		next += temp;
-		if (temp == size)
-			goto done;
 	}
 
 	temp = scnprintf(next, size, "\n");
@@ -435,7 +433,6 @@ static void qh_lines(struct fotg210_hcd *fotg210, struct fotg210_qh *qh,
 	size -= temp;
 	next += temp;
 
-done:
 	*sizep = size;
 	*nextp = next;
 }
-- 
2.42.0

