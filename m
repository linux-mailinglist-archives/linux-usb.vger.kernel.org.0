Return-Path: <linux-usb+bounces-9231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3301E8A0319
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 00:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1AD12846A9
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 22:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAECF190695;
	Wed, 10 Apr 2024 22:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RYdeK15Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB163190690
	for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712787286; cv=none; b=bUnZAPmoE+l2rQ+KzqEfIiwo4zjaUFGRYj7j2rs6R57kJckflhr0XM/79plDtzJ+wLsSyqrwBa77GV9w5IImxCpuBO2/wAhxJIC4yZjFHYTLh/JWsjBg2jzaQdzGvgEnd8Vm9GZj2ZUyq/Ev6eYPX7aMIicRn7t9S7geKwzN6S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712787286; c=relaxed/simple;
	bh=d/PZVCXIhGvDMuyWk0WrFuAP3smrj3JCHcEtray0wQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJbjuaP2GbLs2O/y50oyKBuLspUODwAiK8bQnw50SOb2FJJP1Wsnq+FW7E3X217VUS3jxFp2cFXjix5mSxljsAy4ffDa/4qtThJ+8DLF4tVo3IfQVji/qmWdPR+6ZK1F6iU3qKMtr7A2M/fVY1/P4eabN7jbgckWetvGt+IItRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RYdeK15Q; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-47a337c18d3so89609137.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712787284; x=1713392084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d/PZVCXIhGvDMuyWk0WrFuAP3smrj3JCHcEtray0wQ8=;
        b=RYdeK15QafMgA85JjH67MhD82XF5EOU5MZv4xC7ZJ88B6jaISMR4a4iZNVDmOlwP4l
         UVfxKa7S4mEpuhpuR875BQYDCjLnOmpPYWTSFYhwXLQMLuOlItgeoDKyN9s+vW8uJB6t
         449hOyyHCfX/MwcEDfQ9F49WIzIk/Kv+UH7g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712787284; x=1713392084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/PZVCXIhGvDMuyWk0WrFuAP3smrj3JCHcEtray0wQ8=;
        b=kkUXBzGrnndP8SvCApPIXRSyw7G7A63oFOFnbLbDWtjwcc4RhphlDPee5OP7TgQPAr
         DyXwDK/nU13J0FBoxuXPns/Qo66kwr/q7AIdWKOY6SKWg5fuWOweMa1y1Dgs767NMotZ
         c1LIHgC+tc/3x6woYZEs2W4A3mz2IvmfigwzPh2lmqyp6jtf26H1i260usE1rpCq/8mX
         S4hLuQqlOzycEmOwzIN0b1JiPXzaQR9kC8gs7qVV6uvKqYpm5p3CLFMMfkHEEEJSA8o5
         aayRbc2PHTEypnbZlwt+ncfc6886PJ/UwNkvEsdF717QzISIm9s1a585jEca3UtHzidM
         qzlw==
X-Forwarded-Encrypted: i=1; AJvYcCXbxgGxtXY0BQYtee8MLqyQBsUo6PeGaY2Laxrkwj5MmEoqHY/kMhvJVCpHrFoH3qQNOdPZ6zXafXe5nqZar1xK0T2w/vp7ZxRm
X-Gm-Message-State: AOJu0YxxGiUn51ux4VZTYWjlFJeM2HPiRq5Tp0aLNR9NXoU4115L2gh0
	TnJ0m/Xqwjd5g+/Wbwwz68i+QH4RcfqDxHAKozy1tRxOByA/A9f05YkwRHTJWfidbuN/aAHIwAb
	wC2XSXCKXfwKCC0MQ9MMmqPQQkiy1/YVYY31Q
X-Google-Smtp-Source: AGHT+IFrChd80DZF7LJFx4Xkr2ghYzNtJ/zfR0j7guxDmH4LX1rsmKz3kvZDB9H/NExqbeD9Jxe5T1Yp+TSqQ6v4FcA=
X-Received: by 2002:a05:6102:370a:b0:47a:26ed:8483 with SMTP id
 s10-20020a056102370a00b0047a26ed8483mr2845023vst.14.1712787283771; Wed, 10
 Apr 2024 15:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-public-ucsi-h-v4-0-e770735222a2@chromium.org>
 <20240409-public-ucsi-h-v4-2-e770735222a2@chromium.org> <ZhUcu1k0Cum-IMVQ@google.com>
In-Reply-To: <ZhUcu1k0Cum-IMVQ@google.com>
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 10 Apr 2024 15:14:07 -0700
Message-ID: <CAB2FV=7PWffxLR9yVq2MbVijEesSavKiXFT9ZKwJzDi3SnPQyQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ack to all comments.
I plan to upload the next version after related EC changes land.

