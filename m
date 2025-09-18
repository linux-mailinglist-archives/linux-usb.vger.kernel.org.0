Return-Path: <linux-usb+bounces-28277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6159AB83EB2
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196C04816DE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7623F29B8EF;
	Thu, 18 Sep 2025 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqOJbYiw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0BD2BE7A3
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189146; cv=none; b=jMoECVHZnx4TjjGrjPMLJXRs/Z7zqTe2EChxIH/wWmSQqBF90PY14Njivkg8wqBq250eh9oOA5zVIQz6EweyYv+q1h7XKHADgiuR8N3Rf8AN6BZS+dXQdrgRGrKAq1SKE0/CiQsD/g2/QUhq4D+OUU6XAgKph4Dazm+n1k1NCHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189146; c=relaxed/simple;
	bh=IZx9LG05oj6XU/qGuctI5jmCloGrG1hU8D4xGjYRLVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNcjsZSdXeTba/CO7eA2W0y6EiDm/VCHBl5dyef6fBTRDxRgAITOGY++rzW+xlXSjVUppn2JFAjc3YXVqR0C9scBcwJCg6fayZD+hHMB7BgBbuOiTW8yBdLkmK0AU57KmU6K5eB9voZrPr9oL+IQZ4FdQG2J1AqI5yqhWwEkFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqOJbYiw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so6995535e9.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189142; x=1758793942; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1H93dMZs9g+kYodSEVnTgy7nL/zERNzPkzQfdNwfUg=;
        b=ZqOJbYiwnPIjq4WWAJoKa7LDijvT0Fn9/l79+wPngXuwC04GI1GweTwvP86zrpPVC6
         L+uugE6CcvAeqT7OXGYck7uqRZ+eAt5yPIf/yIxZxgGwsDhbiNhuJVVEXbYNDXW+0OgV
         I8FQqX5MnNdxE87yXmbITEAUgyh+17hG+JYeyA1B+u1NNmFKZWb5rfYxlUFpD4TkCRf1
         SzQ9xW8PFj/4SOs/Ad5lmhqYvBIzBhg5hQlCy6t1KooYUkqgN/FihKJ9W7x1qrpm0p0q
         hsX3gq2AX92qN9od3iaNmSe2KJhLhp+cxpaRvtkqEfgCJOjfpUOdUa4OJoMmKPkHlD7c
         eWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189142; x=1758793942;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1H93dMZs9g+kYodSEVnTgy7nL/zERNzPkzQfdNwfUg=;
        b=AY1G8U7roYdVIiO+FXruu4t9jBYbqFwhzsbsFK80mq0JekAn7fbRDjHQQCvCkddm8d
         i1/z3uKh34kAGn440rKhtPM4mFJiV9z0QQY2lR0K8c5cpaLkO198qJ+qhP+YwHmQpSxH
         ukCoAEZu686M2cka9JziBy+YIsQxraqLJy/Q3WNO2fVeTWSI3iBrJQbxQ1raKEZanUub
         9r9BveVUycP6R95wWwLRjxcS8CQICab3H2aLsu3jT/cQiykGje3u2sfDg8Hc5L7KPDrI
         31M9cEHgZFAYIwvAQkwIMWQwmbdtI8Xk7ax9WTy0pYAYHkVnllV9iM8tXF6XL+LPkp9P
         fmyA==
X-Gm-Message-State: AOJu0YzdFhDSKGJjeYIH8LFY5Pfcc2YvslrrCoFqzOHlAN68eEnqwlcu
	MCENAXAnMuXoQXT6M/awnT2BmAMieo0J4ZF5qCX603/m7FOXU5/CbOoZeaaDAVbnxiBCso3cxNy
	2l5qe
X-Gm-Gg: ASbGncsaTcrWZY3Qv8IyvweVCDUeIbXBSroTs5LhXIS+Hr3piQEnOJQqb5bQZDQFnUK
	DaGM7DLqE7764gFe5I46herX8EbJjgFcDOWwLhOoJ7pm06sH0gXT/FsAEaerCDjpK9PnKVGZzkA
	73+t8Moped5PfIbAZw6DEl74AJ1Gq6y+diHpoeHgBlCmEygoT9l9bwZMO90YnNcHxQRriBJATv0
	mECnwiBmX2znuWT9u0Hggd+2CPXSKUYhjjLRJ7RwuQD5LmVzrsNzG9/wdHtgZm4EBnwWWEluxW0
	/ucS4VkKyAQjPKHwiga1ph5bhXBcZADt8/QV29i6G1ULD9r/kI5kjlUc20VcftK7FAxePo79AJQ
	2yGD0yQ1W1150vT8VXBLzuh0aIkv7h0wn8457M2aUdQYga82nJYDj/DN3
X-Google-Smtp-Source: AGHT+IGedpOHMZz7TERq2YqLSbJt14gQyq4OPiiVwBjTEFGq4kfib3BeTh1DNhFUFuEhQnBlzVO7XA==
X-Received: by 2002:a05:600c:1f89:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-462074c6780mr53714075e9.37.1758189142418;
        Thu, 18 Sep 2025 02:52:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f64ad359sm37903445e9.22.2025.09.18.02.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:52:22 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:52:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hector Martin <marcan@marcan.st>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: tipd: Handle mode transitions for CD321x
Message-ID: <aMvWUtyvtXH2AkIA@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hector Martin,

Commit 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for
CD321x") from Sep 14, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/usb/typec/tipd/core.c:821 cd321x_update_work()
	error: 'tps->partner' dereferencing possible ERR_PTR()

drivers/usb/typec/tipd/core.c
    805         /* Set up partner if we were previously disconnected (or changed). */
    806         if (!tps->partner) {
    807                 struct typec_partner_desc desc;
    808 
    809                 desc.usb_pd = is_pd;
    810                 desc.accessory = TYPEC_ACCESSORY_NONE; /* XXX: handle accessories */
    811                 desc.identity = NULL;
    812 
    813                 if (desc.usb_pd)
    814                         desc.identity = &st.partner_identity;
    815 
    816                 tps->partner = typec_register_partner(tps->port, &desc);
    817                 if (IS_ERR(tps->partner))
                                   ^^^^^^^^^^^^
    818                         dev_warn(tps->dev, "%s: failed to register partnet\n", __func__);

tps->partner is an error pointer.

    819 
    820                 if (desc.identity) {
--> 821                         typec_partner_set_identity(tps->partner);
                                                           ^^^^^^^^^^^^
but typec_partner_set_identity() dereferences it.

    822                         cd321x->cur_partner_identity = st.partner_identity;
    823                 }
    824         }
    825 
    826         /* Update the TypeC MUX/PHY state */
    827         cd321x_typec_update_mode(tps, &st);
    828 
    829         /* Launch the USB role switch */
    830         usb_role_switch_set_role(tps->role_sw, new_role);
    831 
    832         power_supply_changed(tps->psy);
    833 }

regards,
dan carpenter

