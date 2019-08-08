Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D89868F9
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 20:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403994AbfHHSn4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 14:43:56 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38564 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732375AbfHHSn4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 14:43:56 -0400
Received: by mail-qk1-f194.google.com with SMTP id u190so6006052qkh.5
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 11:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Fg/Hg4a9XRkl0/H2jR20HQMQBPhUa67KRqvEb0kFVFs=;
        b=muY67qYB7cLWtuGTKUBMccWvPuetMRp1yAU+R71o4E9fwQfcDjRMqDQQqOPSoz2hlW
         v+D42ifNTbcscas5noHCr6tMnJ5b/IDDnlSJG3Yda3kZdYxX1FKKLVmuIWwJBaU4ybqE
         pwayu6OUhNpnzX4VrxWh1sTudhgijkbUDIzZZXfH1yf/2KSv1zMI/lpPiK6ts3lRUZgA
         cgtLdd/jmKJLOQBBc+erJUT7js+fM1PBIxuk3ilwnC9VjBUULW7qK2iZmy4Z6gIBUSV5
         gUQgIfUHKKXEO0QWyrJ+PQKPk4a1bZDZL0MqOGeEKXTfuzsGGZweJZGW+GOMl0WQKD4c
         zmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Fg/Hg4a9XRkl0/H2jR20HQMQBPhUa67KRqvEb0kFVFs=;
        b=taT56n46gJhiydGA7zmx9l2QpfdOORe45TRuCV0oM7pt+V/T/yLhnxXC2di9iTv+z4
         hCRVT9f3CZ6wr8fEEJ74NfuNkEBPrOkFza5NXJUCvP8b9d0Nm7XAVGEK3oU9/MHKtFQF
         rg+67GW4JsycH+r2j1+mraGDhfKM7DceOgsFxCNg1G9CzBSw/Vio8bUSs8QzZ8F5u1oD
         ZOdMIrbtdfDASO6fhHmiXJfs/+j7sYylmbzShrUqHMkxPHWAWFLbUvP4euaR+QTb8Mhl
         4kduX/T88T81WQrx0GzYPO69byEuXnd+BbpzhuZozQhSFYhOokr+BVj9938Q5R3Hvn/8
         zh0A==
X-Gm-Message-State: APjAAAV+I07iJAyqTrI4xC7J4TZYVA4SJZF85hb+9kmk4pGIJr7iIKOS
        rLKqfx2YnigTDo/tAcPu4MQx9A==
X-Google-Smtp-Source: APXvYqxZgbkVtdawKKn82X9jozH9ZK86/Cfcu9hqZcMml8TkrGDh5lnN6KbDIuLO1LgYVp6nTxXvxg==
X-Received: by 2002:a37:9fc1:: with SMTP id i184mr2518832qke.289.1565289835477;
        Thu, 08 Aug 2019 11:43:55 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id i74sm4184913qke.133.2019.08.08.11.43.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 11:43:55 -0700 (PDT)
Date:   Thu, 8 Aug 2019 11:43:25 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     Maciej Fijalkowski <maciejromanfijalkowski@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        nic_swsd <nic_swsd@realtek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH net-next 5/5] r8152: change rx_frag_head_sz and
 rx_max_agg_num dynamically
Message-ID: <20190808114325.5c346d3a@cakuba.netronome.com>
In-Reply-To: <0835B3720019904CB8F7AA43166CEEB2F18D0F3F@RTITMBSVM03.realtek.com.tw>
References: <1394712342-15778-289-albertk@realtek.com>
        <1394712342-15778-294-albertk@realtek.com>
        <20190806151007.75a8dd2c@cakuba.netronome.com>
        <0835B3720019904CB8F7AA43166CEEB2F18D0D8E@RTITMBSVM03.realtek.com.tw>
        <20190808134959.00006a58@gmail.com>
        <0835B3720019904CB8F7AA43166CEEB2F18D0F3F@RTITMBSVM03.realtek.com.tw>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 8 Aug 2019 12:16:50 +0000, Hayes Wang wrote:
> Maciej Fijalkowski [mailto:maciejromanfijalkowski@gmail.com]
> > Sent: Thursday, August 08, 2019 7:50 PM =20
> > > Excuse me again.
> > > I find the kernel supports the copybreak of Ethtool.
> > > However, I couldn't find a command of Ethtool to use it. =20
> >=20
> > Ummm there's set_tunable ops. Amazon's ena driver is making use of it f=
rom
> > what
> > I see. Look at ena_set_tunable() in
> > drivers/net/ethernet/amazon/ena/ena_ethtool.c. =20
>=20
> The kernel could support it. And I has finished it.
> However, when I want to test it by ethtool, I couldn't find suitable comm=
and.
> I couldn't find relative feature in the source code of ethtool, either.

It's possible it's not implemented in the user space tool =F0=9F=A4=94

Looks like it got posted here:

https://www.spinics.net/lists/netdev/msg299877.html

But perhaps never finished?=20

It should be fairly straightforward to implement by looking at how
phy-tunables are handled.
