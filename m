Return-Path: <linux-usb+bounces-8950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4CE898FC7
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 22:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5FCD1C22C93
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 20:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7060F13B7A1;
	Thu,  4 Apr 2024 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OGHQ9Otk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1513A890
	for <linux-usb@vger.kernel.org>; Thu,  4 Apr 2024 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712263508; cv=none; b=mRswI9F63B7fMECk32WMvqMI8BdMYe+wY+YDbbM1E21SFbzGhEyECI9zYHoxSBm+BsC7vqz4u+memAiPmkZcXxDrl1Z1NBriVlHY7zNpuzRut5ncxvOz+ZWeOcSR8aTccxWArL9LToU/mTieoXYh+wt0TI1pI+6Ti6t+xbBK2hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712263508; c=relaxed/simple;
	bh=4UO1VMYWun6t0P6nH+mG+xdFydZVyE+pOaRYVYx4yog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRMsZlP42Et94xpdCAfFPHRd76oKxtKGjv77uLoDcUmU6bYKo9sbw5Km8K7rJdbzgxxShrz0a6S38FqKB3ZnX+0e9HB4E1BP1pQXed2CmX0klS1+AkFBGn9PDxxhZsFxmZBt6j/sSN3nB0jOP3kizcf3TY+zPsVzj5nXrHHwsRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OGHQ9Otk; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4d47000f875so520358e0c.2
        for <linux-usb@vger.kernel.org>; Thu, 04 Apr 2024 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712263505; x=1712868305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF8FNJKbIf/Wqy3NgLHLUIDfVpXMUebZHQXlpWQnHwE=;
        b=OGHQ9Otk51j3QkwxtNFs3R5EmKGoHTZB6h4lLf0rwEowgUeyMnIIhevJ5+qcroer9t
         FQQWNmLgX1L+7qAqFa5L5aHmcDr2uIc4nUYPOYj7prGRk+fdrC5awWKBSQUfFtlaS0G/
         MkmFjoqOOTOnslZKxXdxi6SnBKrGOto2s8lTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712263505; x=1712868305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF8FNJKbIf/Wqy3NgLHLUIDfVpXMUebZHQXlpWQnHwE=;
        b=ZNylMn0rGbKbbONbc56uCkSKQIABuUI+zIhZY0urTJDLpPdzimKkKlHioD4/sWit88
         DWOFf3pIVZmLtLZpH22kVo2GJAHvUv6iF3jZBlXVQJBAZxL+kZ0sFouFJiwFsMjDWrv3
         jWYs1YWNDcGhXd7IKFwO6ycNW3N+wB3kPaPPjBWCnlvslZyoik25nMI52lnCO93R9uS7
         vOHXA+2AR2AVfQKQ5Ph+jlctnxzf2qpTjdLkbUKD/anpAP8jtIPxWOLY4DaVTJ4fc5DD
         t6jGlxoLQ0VoFbt0KxzQLaYBVHKIy/oo4drPa8EMF19/AZZVysG9Sg3I5lpHVApDjG/E
         bhwg==
X-Forwarded-Encrypted: i=1; AJvYcCUUn9WPmv6dW6/dJ1tzU5M04EbDLv5qHrSgfyBjTdup7tXmwVvK2sMVafu5dJyYnLFQvqCEcbAcGyc388JD0o0Ci6gfob7jiIX/
X-Gm-Message-State: AOJu0YxE2PQiE9bom0HZlXNMzAiYtt4JdGuXxDWOn2ic9JdwKqeWzuta
	a+ukVJXhTVJ+D54A1N/IyfM+/06aEFSXbyvfQMXisJyQUbMbheu+DJcRV5CC4Zg6K+hdCHzF9cd
	BlmXzcxg/K9jKhnlrSug69tCAxnHaO/hywavR
X-Google-Smtp-Source: AGHT+IE1aT12rSJQsk49m0s1WDAmGtg1boyflA0mWV27eiMvdQWflqasXIA0kULyhEfYJsr1EVtT0Cfl08bXuJZCc+c=
X-Received: by 2002:a1f:f2c6:0:b0:4d3:3adc:b639 with SMTP id
 q189-20020a1ff2c6000000b004d33adcb639mr3392151vkh.6.1712263505418; Thu, 04
 Apr 2024 13:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org> <3ezjocthsigo3t746slmgzffnmpxw7wwf3s535basiaf2qy6io@7ocxva6ndsbt>
 <2024040449-average-foyer-defa@gregkh>
In-Reply-To: <2024040449-average-foyer-defa@gregkh>
From: Pavan Holla <pholla@chromium.org>
Date: Thu, 4 Apr 2024 13:44:29 -0700
Message-ID: <CAB2FV=4TQZwM6bRSeBhieqU2H8yxt3NWsey55a5my_i1La0fJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 6:07=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 03, 2024 at 09:58:33PM +0300, Dmitry Baryshkov wrote:
> > I think it's better be written as
> >
> > if (WARN_ON_ONCE(val_len > MAX_EC_DATA_SIZE))
> >       return -EINVAL;
>
> So if you trigger this, you just rebooted all boxes that have
> panic-on-warn enabled (hint, the HUGE majority in quantity of Linux
> systems out there.)
>
> So don't do that, just handle it like this.
>
> BUT, if this can be triggered by userspace, do NOT use dev_err() as that
> will just allow userspace to flood the kernel log.
>
> Pavan, who calls this?  If userspace, this needs to be fixed.  If it's
> only a kernel driver, it's fine as-is.

This code is only called by a kernel driver.

Thanks,
Pavan

