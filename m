Return-Path: <linux-usb+bounces-23098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E1A8A60E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 19:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0536C16CA31
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 17:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9334C22155D;
	Tue, 15 Apr 2025 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9pXhF6L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FA522128A
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739610; cv=none; b=Ugi57pGTpWCb917VxZtxozL4spdjyMp7v+qr8XQXUMkpNwXT2q99fH2ubaPuk1Ca9KAANbiBsr1EQuGmAC4SBqlJyGPPbPxdYOTODLo0k+SWLwWPbyGBK6bd++T7gXxAX/F8G7F4cILa1n3bv6rdrs3HW1jHduI9deavrM/75+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739610; c=relaxed/simple;
	bh=MhTZKPt/csCkJp2RMKqukd8vF8p3+tUrakLPqLNuPFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oh/UtcHofBeI+3xXtHJ9hj6bcRin0xpgkqPzlj61MTU9O1NHitg7SADaXENyI1P1WidxS6eA7h/hmpOroy23BfAIF0pyISX+NFsm7cNhk+uEkcjeBJMVvNd1rl7HO6U+KPF0SEETw6wU7/8nKDScI/iSLcsoATHU681p8KXCWlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9pXhF6L; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227c7e57da2so52624555ad.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 10:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744739608; x=1745344408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1JmeOVHKNHQJUYOxIuGuUZWUyxlqcWpw3phE4gU874=;
        b=a9pXhF6LaXtc9+PisC3lfrMc4wIWYuwftk7IEL8pT0IY/LY0nLXSyPxJGcmO+V4MkD
         Z46knuDVKCqbeUNQ2AoRjCLYUTatsIbAsXkQTWqYOaDKZ70K2nKqeJd2AgbK5l44USi6
         lN91v5qK9E6Oz6gX0y7y/bL/f4GnL4RSseaHHcDgsYI3rj0C91Do47Y+E/prVVgIA+Oh
         EO1pD7ZkRAwBadfrjzdML0KAKC8Hb7W9U4zcWgd1h2I1hA1qyou9BqVjuacbXZyuu223
         BoBU30h/vXW39c18OX7QLFd/yXTKwWwrO7rDfrJpB12OkBZPQEHNhJrhLpyWaN60zgrp
         dW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744739608; x=1745344408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1JmeOVHKNHQJUYOxIuGuUZWUyxlqcWpw3phE4gU874=;
        b=kgf3cWSmYI2J9IySvGwwhnYEByTkZhLXod7ng7ysgGsUM44qR7MEA6SX8E3u3pdvBr
         MsY9QWbx2bP8pqw2W4/GDUWUSC70Iu8QaqqPopPk+WZ/ySuVzqH+mzhcNTHWEfVfRLw1
         Cv2+LLG3y3aszYN9UyxhJGv+sZUvz9F3L356J9ncQN4qBJ8MBeoO/0fxSu+9ualCCKUj
         mgy2tLMnAv7hTm1gEiXYZkdtUptOgVL478fKQgvEwjpQldxnAmyEJ3ci9mOhdYF04Hrc
         PDlKTXZLjaEtWS1obGNUkuvykgQa+zDP6lXv7BTHIjkR4vfGduS/QQ7Hna8dHuG/Rki7
         hdfg==
X-Gm-Message-State: AOJu0YwihlgGLw4f9yte8ITBejcwpdV+FsCuyd9fay96UrCuwYikYfSa
	gMBHoLAyXyhzVqHVJKzBdmKdn1awnmHpmrt48VeUtTh8/0GBHazW
X-Gm-Gg: ASbGncvOmLWSeRq+OnuGmizGiC+wJB3n0S6EcLhg3ByzFqjBsiRHyBYYNEI3RfbfbwM
	m30STyMgL4TdU8vkJPmwFhsjlw67eDE+dOlwuWoNFe4RaHWRlWvg4pQY55IuaGg1YHzDlVkb6dm
	ixPGaHFbn6id4nMY07nWjoS2uwmD8grC5Bvzro9PTo4ic/qt7o/SZIEP8aCrMj/o4KZdRXJwzAA
	e2AiK8M4YlIQWCDNotENIVTcAspbGRI+OnMwxemXcpS8jNWpciDDTTCInPSYQGWDt8NgShG2mjq
	1mqaaHXdrJVa1qBZKI5CxNfxWJciualR0mgfCkuZZ3MwCsBRag==
X-Google-Smtp-Source: AGHT+IFJh/1v4Ynw5/SUSwbp3WV2FsvFdqPvTu1PJru419y7H5A2D+i67bhRkDj+6WPYeVW1ow5X4Q==
X-Received: by 2002:a17:902:d4c5:b0:224:10b9:357a with SMTP id d9443c01a7336-22c31a7ef34mr609705ad.32.1744739607954;
        Tue, 15 Apr 2025 10:53:27 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c99328sm121360805ad.114.2025.04.15.10.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:53:27 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: dan.carpenter@linaro.org
Cc: linux-usb@vger.kernel.org,
	mitltlatltl@gmail.com
Subject: Re: [bug report] usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
Date: Wed, 16 Apr 2025 01:51:11 +0800
Message-ID: <20250415175121.132348-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <Z_44zoTyLLdXNkKT@stanley.mountain>
References: <Z_44zoTyLLdXNkKT@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Apr 15, 2025 at 6:45 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> Hello Pengyu Luo,
>
> Commit 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi
> driver") from Mar 16, 2025 (linux-next), leads to the following
> Smatch static checker warning:
>
> 	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c:372 gaokun_ucsi_notify()
> 	error: uninitialized symbol 'cci'.

Hi, Dan. Thanks for pointing out it, I have sent the patch to fix it.
https://lore.kernel.org/linux-usb/20250415172006.126740-1-mitltlatltl@gmail.com

Best wishes,
Pengyu

