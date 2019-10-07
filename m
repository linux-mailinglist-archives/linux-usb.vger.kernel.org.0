Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6F3CE77C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 17:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfJGPaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 11:30:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45047 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGPaz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 11:30:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id u12so90311pgb.11
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=5NSccauLcWUBoxjRIE34pua8mfG+v+wacX+TYVO7UnM=;
        b=bJ+dwD0Fy8g/wGiO8/fTmd7yA+xnaPq6dmQxOt42FaNqRnqi4PB88wWKcch8UxhTpI
         hudh4e0C51KQMKYdSDCW6qsTgFp1U/WqQG4Guh4qBVVVWK64bMGqZszPRErliLxVYPZa
         A/Va+Faoh0EJU5sw2RllT/MucGZlkfS58qhCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=5NSccauLcWUBoxjRIE34pua8mfG+v+wacX+TYVO7UnM=;
        b=jtMXg8JBfGGzXgAK7SHgtFNGgZ25zVHtprakw7eiFFjLIKvNNU9DDadIdUcScLqP4z
         vuKiMmQ4wFZNVPO0w++O0+zWY8E+eaWXDe7PyxxIdSvFIpY1G51Fcgdyfi7duI91rwRy
         w+gbzap4kWZLeYLoHZJps4aYsmquucPe6qD8yWcQ80wp2vqv44b4/dgvaNiFY/cZv8rU
         0ArA9p5v0p1a2YMepmnMtg/VVcclejJiR2IlN/nunqyEz+JCfuQdxsZMhUXrVZnInDDd
         r9l3WltD6VbL3SE4fqWkaCmYYGVROh4mpoSoByJLEHdwl6Qi8QqZ64TR9trIWBT9u2yL
         VxRw==
X-Gm-Message-State: APjAAAVVDy3npS9vr1ijqOhNYnzqzFQryg0Au293I/qgTIXFO2dRAvgM
        4+5lm75sYs1aDZ62oQfMC1gICfjOUyM=
X-Google-Smtp-Source: APXvYqyReDvh7dM/3GC9/NGVuLCTtl+kQAQr0uH3LOVAMLJICa5UI1YvrPS32/ceGNP4PRsF/i7HzA==
X-Received: by 2002:a63:144e:: with SMTP id 14mr23706462pgu.408.1570462253961;
        Mon, 07 Oct 2019 08:30:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r2sm17254536pfq.60.2019.10.07.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:30:53 -0700 (PDT)
Message-ID: <5d9b5a2d.1c69fb81.c81a9.459d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191005210449.3926-2-hdegoede@redhat.com>
References: <20191005210449.3926-1-hdegoede@redhat.com> <20191005210449.3926-2-hdegoede@redhat.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: platform: Add platform_get_irq_byname_optional()
User-Agent: alot/0.8.1
Date:   Mon, 07 Oct 2019 08:30:52 -0700
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Hans de Goede (2019-10-05 14:04:47)
> Some drivers (e.g dwc3) first try to get an IRQ byname and then fall
> back to the one at index 0. In this case we do not want the error(s)
> printed by platform_get_irq_byname(). This commit adds a new
> platform_get_irq_byname_optional(), which does not print errors, for this.
>=20
> While at it also improve the kdoc text for platform_get_irq_byname() a bi=
t.
>=20
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D205037
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

