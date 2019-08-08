Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35D5D86178
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 14:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbfHHMRD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 8 Aug 2019 08:17:03 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:42709 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfHHMRD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 08:17:03 -0400
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x78CGwi7006268, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV02.realtek.com.tw[172.21.6.19])
        by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x78CGwi7006268
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 8 Aug 2019 20:16:58 +0800
Received: from RTITMBSVM03.realtek.com.tw ([fe80::e1fe:b2c1:57ec:f8e1]) by
 RTITCASV02.realtek.com.tw ([::1]) with mapi id 14.03.0468.000; Thu, 8 Aug
 2019 20:16:52 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     Maciej Fijalkowski <maciejromanfijalkowski@gmail.com>
CC:     Jakub Kicinski <jakub.kicinski@netronome.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        nic_swsd <nic_swsd@realtek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH net-next 5/5] r8152: change rx_frag_head_sz and rx_max_agg_num dynamically
Thread-Topic: [PATCH net-next 5/5] r8152: change rx_frag_head_sz and
 rx_max_agg_num dynamically
Thread-Index: AQHVTEjAduvqUw50CkySh6Q/0oky4abuKLuAgALKe5D//6zrgIAAi5Rw
Date:   Thu, 8 Aug 2019 12:16:50 +0000
Message-ID: <0835B3720019904CB8F7AA43166CEEB2F18D0F3F@RTITMBSVM03.realtek.com.tw>
References: <1394712342-15778-289-albertk@realtek.com>
        <1394712342-15778-294-albertk@realtek.com>
        <20190806151007.75a8dd2c@cakuba.netronome.com>
        <0835B3720019904CB8F7AA43166CEEB2F18D0D8E@RTITMBSVM03.realtek.com.tw>
 <20190808134959.00006a58@gmail.com>
In-Reply-To: <20190808134959.00006a58@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.177.214]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Maciej Fijalkowski [mailto:maciejromanfijalkowski@gmail.com]
> Sent: Thursday, August 08, 2019 7:50 PM
[...]
> > Excuse me again.
> > I find the kernel supports the copybreak of Ethtool.
> > However, I couldn't find a command of Ethtool to use it.
> 
> Ummm there's set_tunable ops. Amazon's ena driver is making use of it from
> what
> I see. Look at ena_set_tunable() in
> drivers/net/ethernet/amazon/ena/ena_ethtool.c.

The kernel could support it. And I has finished it.
However, when I want to test it by ethtool, I couldn't find suitable command.
I couldn't find relative feature in the source code of ethtool, either.


Best Regards,
Hayes


