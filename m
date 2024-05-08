Return-Path: <linux-usb+bounces-10125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C398BF7C7
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 09:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 844291C2029A
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 07:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C54A3613C;
	Wed,  8 May 2024 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uC71IjIF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445123F8D0
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715154794; cv=none; b=Zf14k0nVQdT0xDe0zESdtnNN+CpXgqc8R5KHRlNZo2KaUZyCJ+PIE3tub2C8tFCkcQoFA0p/1S8RPd0u+EtTrStaeHAJ7d7faElUCVYgBVngqY5oHdtrKhN7Bud+1CMDs8IR3zzjOdBQVLs5BC2OVK0U97d4CKoN39LFucdukhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715154794; c=relaxed/simple;
	bh=KqzMlW2K41PeNiZQbJkOH4GSHF5EyaQ557XkBzHUURI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpEQE1JdWKD8et+b6+9+ptOZdjV4yBV2gVsTeIXt4ZfGr53suZn9vaeFLQyFG6oWreRcLJidyu5hkbUOz/y7Xnhb5Z6K5OYd23b3C8hCrO4L6/m/2KrcF0uBqgA+wgW3krUkqQlnipNF0qxqnhhwsHJ4JTyuMQ6rII//LxbRgPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uC71IjIF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59a387fbc9so1011413266b.1
        for <linux-usb@vger.kernel.org>; Wed, 08 May 2024 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715154790; x=1715759590; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArIySZdI+wtPrwPuuH3tuyxsnRcsZ5+r2wK76wTw7FE=;
        b=uC71IjIFSzqNWNp1bO/7XpCOwVCpquQ3pROUQjd0x+4ImP02wdGmplPW36bti0td+g
         4EEpQEDfRAM9MkOS1pKS4UTPmoYRkc+GBjlr5EohCizvccjNufMk5hFR0JAQ+LmGh3IY
         nVyLFKmEZtx+W5O9yi75BRubl3cOxfFTpyOx/M/ZVyigPZgHRkCkHAI0mJ1E4hgg1dbY
         oobv/TpLxNH5OxmSAZyZt2C59GzouFfZy7sCppsPOFDekgKmSqk7d/Tjs6tVdP9RB+JT
         sqDK4Nb4GrF9HRTDt3/jIpBg0BnchvIxMiEtscVEvM60PAh7KN21HFyiJZv+s5Ju8/uw
         8Tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715154790; x=1715759590;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArIySZdI+wtPrwPuuH3tuyxsnRcsZ5+r2wK76wTw7FE=;
        b=m4o/7d8SneBeFcUM6nqoHHp5cFGsMhxktOP1BZVwcsx8rO6aU3Q7Nt8sPmDbmcSFXC
         QDjm8PRYeV3BZtlpodlq9yjaJhefOsW21G87GJg4O46rQ7z75tyxV5zs1DzAn1qDr0eJ
         7yOeNzJbfeyREFIRgJaPNVkU6Tu1c3nx+K97eB9L+5tj67VxewBsoDzcxJhWuxfG7i5u
         qGYgziVRQzLw+GWtBY0XTLPMXbyQeBRbZITf6DKvSoZ3LC3gvT528hzNywhdDqso4Yd6
         3BNDrdqwr9O5/q6ChyHV2yUpWfqv1gO6g9RwrkhCDUMBlRRwE7gFAwi9WmtC9PJdk+ta
         cvqA==
X-Gm-Message-State: AOJu0YxFhNe3pCEcMeNbaiZXyoBTCqbumNoaPSObauyqMPNrK06Q4w6g
	I4BG+lcwWaXYdh3d3vce+jY6Wes3M3AABeXcHQHK2h8vNIvZWRZvnBSlVY8RDmo=
X-Google-Smtp-Source: AGHT+IEFs5moQBlRJVABpggUgOqlWWdYdi5LXwWXIDOsRJ3q4v4gvooTYEryXqnFkBzBhzFqIhEDOQ==
X-Received: by 2002:a17:906:2dc1:b0:a59:ae6e:486f with SMTP id a640c23a62f3a-a59fb9e5a37mr93056966b.65.1715154790370;
        Wed, 08 May 2024 00:53:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id rh12-20020a17090720ec00b00a59a0cbf048sm5715053ejb.13.2024.05.08.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 00:53:10 -0700 (PDT)
Date: Wed, 8 May 2024 10:53:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: diogo.ivo@tecnico.ulisboa.pt
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: ucsi: Only enable supported notifications
Message-ID: <dd955f16-bbb9-4d51-98ea-31cad358ab69@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Diogo Ivo,

Commit 27ffe4ff0b33 ("usb: typec: ucsi: Only enable supported
notifications") from Mar 27, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/usb/typec/ucsi/ucsi.c:1671 ucsi_get_supported_notifications()
	warn: was expecting a 64 bit value instead of '((((1))) << (24))'

drivers/usb/typec/ucsi/ucsi.c
    1665 static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
    1666 {
    1667         u8 features = ucsi->cap.features;
    1668         u64 ntfy = UCSI_ENABLE_NTFY_ALL;
    1669 
    1670         if (!(features & UCSI_CAP_ALT_MODE_DETAILS))
--> 1671                 ntfy &= ~UCSI_ENABLE_NTFY_CAM_CHANGE;

ntfy is a u64 but UCSI_ENABLE_NTFY_CAM_CHANGE is unsigned long.  So on
a 32 bit system this will clear the high 32 bits.  So far as I can see
ntfy should just be a u32.  Either way, the types should match.
BIT_ULL() is the way to do that if it really needs to be a u64.

    1672 
    1673         if (!(features & UCSI_CAP_PDO_DETAILS))
    1674                 ntfy &= ~(UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE |
    1675                           UCSI_ENABLE_NTFY_CAP_CHANGE);
    1676 
    1677         if (!(features & UCSI_CAP_EXT_SUPPLY_NOTIFICATIONS))
    1678                 ntfy &= ~UCSI_ENABLE_NTFY_EXT_PWR_SRC_CHANGE;
    1679 
    1680         if (!(features & UCSI_CAP_PD_RESET))
    1681                 ntfy &= ~UCSI_ENABLE_NTFY_PD_RESET_COMPLETE;
    1682 
    1683         return ntfy;
    1684 }

regards,
dan carpenter

