Return-Path: <linux-usb+bounces-10011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497C8BAC10
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 14:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1723C1F22C8E
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149361534E7;
	Fri,  3 May 2024 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZ+iyjq4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA4153503
	for <linux-usb@vger.kernel.org>; Fri,  3 May 2024 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737836; cv=none; b=lVfZGR5TYOz7HCHumlK2NyeI+5j5CXXK8buXebSsnaKhZbHEBQLaClJVXm+2w4p7JF//omnqFpAAVRABIqfD6AqAni6FnggmNSDFXv5M+BU1mhsUmvz0NwcDgJLKYno4Q1WwcmYgMT8K5oi/vghJ5igY04PS7wZyRhU2FPn8o80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737836; c=relaxed/simple;
	bh=YAfw+44GrwxVCpNrIpKjwL11goqT1d4qp4kk6VgGVZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQZZTE6+811YY9HCScUVwwrkNvBCgzZKOL5rgN0rzOeFEFNSyzR6jvVl55Zp9UYsAit3r1+2OZfF1lBHcDd1IhOMPtW77v0bQvfV3GlzjWdwC/4iCnkrfe4UBl0bHVn2O2qbd/O+b24y1UNwCAGCdeSM39Ok1YQ65M2Y/iv4Mcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZ+iyjq4; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2dd615b6c44so100971031fa.0
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2024 05:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714737831; x=1715342631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FSYDfuxpfpjjgO0TIUjpx7luoxEoUEhhOeg90L/l18U=;
        b=QZ+iyjq4hEvf4EBR2WyaQjE4zOxSfufNdX98JEuAkfBwcZUUeMOTrDkAajUWQOPWLf
         tZpzMgp+B4FFMQ7k8k3uGBqADT12kgKISa3RyEQOOy5zl8gP5Tzyb3VBpuyp1UPoGSN7
         CuuviI12I/LAaNwHo4+XC/iUIe6wlI0z6XUt15/Rh1OGc0Sm0AXdqe+FBSnUwj0M4eRI
         CCsDrNt7JTiBZcPQXsNJiiVnOjwNqctqBsA3b4Z1vnz+wg/DQXaZkP7C7cDLPC2TBtIR
         Bwfv0KjMCEPmuae0UOVxQ5uwgZJv2PCofS4h0kgeDIz3Conl+tr5s30+pPJht55KCb5T
         jzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737831; x=1715342631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSYDfuxpfpjjgO0TIUjpx7luoxEoUEhhOeg90L/l18U=;
        b=DTMAcZe/7/C/2PBuSADIYGB6KDl4vCAz/9cVPFOrlMEzyZL19c1q+h3WltubOypI8/
         ApnP/TAtdjbpE8Q/7DJaa3G8WmVAPD6BEGBvpOYQI87C2qBKCOfmXW1uEN962ZliYf2t
         vhUfoRLjes3Lkz5d1I0HhRaOVRZ6E1N0trStWsC1OjaCCugwecld6msCObPgvKL4Wo8z
         rQoT0Tt72rd+/LhsluO8j/VrByzZOBaKgoNJ/KLzt4128e+4fWneQGx0TFeb+wHZIbiv
         A+pq1JemXGHY8yd9i5n3vZH962gW+yi4+vo58pqkLHUCZqx/H150WyopjhVIjLabMU/B
         vdhA==
X-Forwarded-Encrypted: i=1; AJvYcCW7xrcFFFtAmjXtpSF0oBBAAkeAQ2o2VQcfbpjaQ08f1+gIv7wCJpRcwKwgyWQ7GsdOg2PFhP/zltwdAHYPX2O/NM84cyz6kgnI
X-Gm-Message-State: AOJu0YxlMnYl+LKzOHielWuM1Zl9kYXXHVrcsjl0vsFan4TFSyys9UPQ
	U6OnnrvMj6yxPubIDpSMc1BReeNylkEfS9BX1Cm+oOwIuHcQKAgcp5kB6ncSJkg=
X-Google-Smtp-Source: AGHT+IFA1sx3j8flPwKwUT2GNTegKECdDziIj/x8NxqUEUwJkdRekIZxfJ+EtP+j4wc2SkthFoSueg==
X-Received: by 2002:a2e:b17c:0:b0:2e1:bdfd:ce5f with SMTP id a28-20020a2eb17c000000b002e1bdfdce5fmr1718819ljm.44.1714737830869;
        Fri, 03 May 2024 05:03:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c1d8900b0041563096e15sm9203067wms.5.2024.05.03.05.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 05:03:50 -0700 (PDT)
Date: Fri, 3 May 2024 15:03:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pmalani@chromium.org, bleung@google.com,
	abhishekpandit@chromium.org, andersson@kernel.org,
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com,
	gregkh@linuxfoundation.org, hdegoede@redhat.com,
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com,
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
Message-ID: <b5b19387-691c-45ac-b457-2bfaad1e681e@moroto.mountain>
References: <20240424014821.4154159-1-jthies@google.com>
 <20240424014821.4154159-2-jthies@google.com>
 <32855f4c-f219-4396-81c3-42cbea9fe4da@moroto.mountain>
 <CAMFSARc7GPZuvX1wbyvz2uPUeORObuw3=JQ1QwKYRenaofXvBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMFSARc7GPZuvX1wbyvz2uPUeORObuw3=JQ1QwKYRenaofXvBQ@mail.gmail.com>

It looks like in v3 you changed this to:

-       return NULL;
+       return typec_port_register_altmode(con->port, desc);

Which is fine.  Returning a special error pointer which means success is
the part that I objected to.

regards,
dan carpenter



