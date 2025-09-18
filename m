Return-Path: <linux-usb+bounces-28275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3399CB83EA3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB0194A4EE5
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DFB27AC4C;
	Thu, 18 Sep 2025 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQB1Avx+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11408320F
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189082; cv=none; b=QjyFVEk0KYFLTj/R0l2XZIhSYgnOCS+LV5DJRR/T9DP8inqqI43dT04y9NQAxgx+2WrZxP++4Cpyi/4YYflWaL+lWnwt7702F5KoRzHNEMYJ488CbkUta/UOuewX3Gd3MQ+Np8OsBudkqjpFPZImH1CMAtf00ffcgbNoGPlc394=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189082; c=relaxed/simple;
	bh=5TXdxhNXrvl47wOLegKaqnzjG67M7F/h2ZCP3eWRk0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGXgD4eyKX5PPEsld8ilsh/noGFv5L9YXOIQf6fYixEjjii4U1rmaCaq5y3vjxvUTf1R1jQt6Zz5wwHjr9Zxc5VyQw5icYC1D1uzyjn77hBKZDPV6sNvgzC/dDSOJzesRyqoNqsj7O36RE6wnKzFcxaXf7fNKHn7Ua7Nd0IjF7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQB1Avx+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso4354095e9.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189079; x=1758793879; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/lB5DjeDkALs+VRIM1PrZzfZ0uClPz3uQV6nRckuDfQ=;
        b=dQB1Avx+6vvfeFW2kH83ufcBfILkW1KI/TiJVn1NhxD6ueigTXqLCvQuG8UY5x0BJa
         NmzyUw5P39WcoN6EN4tthut8xsnyhPz+BMpKr/UxNfiXo7dYny0XdyXuMDZ6wJWG4TzZ
         BGn8QtzAHW8Gn26dLBWgzEPTKxeTSNooTwNoUh2ngr+ODyraeJD5XUbVgzp8djSNLqHF
         EGZ84eW1b0YMGNzyUFZ90agb8OACpOB3UpEflg53rXRNiTSTtPRu5BS1hlq+PM0mChoW
         oQRle7VGXRYBcRoPYZOE6uLJi0oJ/GBEgkMI5VoHIiUgtZWgLHR5UkcWd79f2GlopLfn
         w3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189079; x=1758793879;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lB5DjeDkALs+VRIM1PrZzfZ0uClPz3uQV6nRckuDfQ=;
        b=R9ZFpbpT7jG1ODFFGll7UKUq2pBNnRg+d7jaE6HzQPgzPjS56SuTSmaUirP6sR5oJ4
         xJqxzDv8st3HROZCdppTSlqGjCZkEuGTP13FCMPrFAlA9jOqVZf4wlXCzy9Vt4KGfWGR
         sxlBe2dgrEsXA9X+/8hz9YCN2r2OB0ShQ2FmKsxAB5Q503UnSeAIKI6EAXNUruIgpqO2
         Zx04ZZyXHfBTQHDzxHx6U4BPG0v+AFEjlPsBN171QzPY03lz3VaDZZAWhSB1OveTDxK0
         xrdx5nuroH3SVv4I8hem1Rixf5fdP805GYLAMLX4DjPJOsXk3EdNTk0u8xxIsP7xy9pl
         Xj/w==
X-Gm-Message-State: AOJu0YxUgBibieE9iyXLeTK3DGaphcx0AHTAXpxv7wE6Wg3Jx2iPM5KF
	KQGndwbJPw8A7Hu0TNE36fkjt2ZSk9uQX7suPhB0MR+tOl4ZA1SiQDMGbdAVXffnWXTWCyBGBGx
	DigNC
X-Gm-Gg: ASbGncvu7rOtbHF47Hn8FlQS3F0eOf0QaUkAJ89tlr39MU68Px7Sn0y9zTN+eEuhmHx
	QTtDa1fGaMOoKe2GoCfCGwNNInb9KcQzbis7FH+aQ1V+bgqVAxFMCmwwRLkzAvK+nMrSKFotQri
	49MgEpQfdz5NKeXKiy5jSyAdQoxXxDRM6xxxVbPKDt+nIrrlah5NFP+O7lzr6dJEXx2jl3bRjKV
	7QdMySfCccGpqAJl5ISPL2DiAFbH3wYzXVaVdVlZNdNIaNH3ix801VK1A8mfEktL9Go6ysHIkGv
	rr5RsQWVISZOzpE4Qsybc+P3F8x5MbS7xXK0cWFLYoTm5FlU4OUuo24qYB4D5gxMORCHaDtXfhi
	lpiczYBfqV7hAP29KRrZ2qobaCISxtjDhXMHLu9rKbBT5Ag==
X-Google-Smtp-Source: AGHT+IH0qI6XNNgFIiuh2o+SgGakHShQRvUukbzwH9voVf3KXZ/RiLCNsMUtZTbrYVq1HJCBWPco6A==
X-Received: by 2002:a05:600c:198f:b0:45c:b601:660a with SMTP id 5b1f17b1804b1-46205cc8658mr53932895e9.23.1758189079366;
        Thu, 18 Sep 2025 02:51:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4613d14d564sm83864175e9.14.2025.09.18.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:51:19 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:51:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: misc: Add Intel USBIO bridge driver
Message-ID: <aMvWE0lD3q86JE4k@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Israel Cepeda,

Commit 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver") from
Sep 11, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/usb/misc/usbio.c:187 usbio_ctrl_msg() warn: 'ret' possible negative type promoted to high
drivers/usb/misc/usbio.c:187 usbio_ctrl_msg() warn: error code type promoted to positive: 'ret'
drivers/usb/misc/usbio.c:189 usbio_ctrl_msg() warn: condition is always false

drivers/usb/misc/usbio.c
    180         pipe = usb_rcvctrlpipe(usbio->udev, usbio->ctrl_pipe);
    181         cpkt_len = sizeof(*cpkt) + ibuf_len;
    182         ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_IN, 0, 0,
    183                               cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
    184         dev_dbg(usbio->dev, "control in %d hdr %*phN data %*phN\n", ret,
    185                 (int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
                        ^^^^^^^^^^^^^^^^^^
Instead of casting, these should use %z or whatever...

    186 
--> 187         if (ret < sizeof(*cpkt)) {
                    ^^^^^^^^^^^^^^^^^^^
if ret is negative then here it's type promoted to a high positive value.

    188                 dev_err(usbio->dev, "USB control in failed: %d\n", ret);
    189                 return (ret < 0) ? ret : -EPROTO;
                                ^^^^^^^
impossible.

    190         }
    191 
    192         if (cpkt->header.type != type || cpkt->header.cmd != cmd ||
    193             !(cpkt->header.flags & USBIO_PKTFLAG_RSP)) {
    194                 dev_err(usbio->dev, "Unexpected reply type: %u, cmd: %u, flags: %u\n",
    195                         cpkt->header.type, cpkt->header.cmd, cpkt->header.flags);
    196                 return -EPROTO;
    197         }
    198 
    199         if (cpkt->header.flags & USBIO_PKTFLAG_ERR)
    200                 return -EREMOTEIO;
    201 
    202         if (ibuf_len < cpkt->len)
    203                 return -ENOSPC;
    204 
    205         memcpy(ibuf, cpkt->data, cpkt->len);
    206 
    207         return cpkt->len;
    208 }

regards,
dan carpenter

