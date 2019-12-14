Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE7511F0A3
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2019 08:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfLNHDN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Dec 2019 02:03:13 -0500
Received: from delivery.mailspamprotection.com ([184.154.205.35]:53981 "EHLO
        delivery.mailspamprotection.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725851AbfLNHDN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Dec 2019 02:03:13 -0500
X-Greylist: delayed 7003 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Dec 2019 02:03:13 EST
Received: from ns1.sgp65.siteground.asia ([77.104.150.195] helo=sgp65.siteground.asia)
        by se5.mailspamprotection.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ifxUL-0006Er-AK; Fri, 13 Dec 2019 20:49:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=fantasiechocolate.com; s=default; h=Reply-To:Date:From:To:Subject:
        Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
        Sender:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=G9LTS5QPxJ/s89LVw4V0N76a9Lg4GJG1FaRG84gTZKM=; b=qdvxPHt5VxKV+T6JLLl8dSivS
        +E2M6T87d24OhNSktjyMLzjmAQ4+0SISVMNAsY0of/0r1aIrUz8Q9QB6eBaJUz1Hw+2UdQrH1hgMB
        qgAdusptjcjzEx6cAfwdVwuBwIjvvlOeghtvjNja9EqMbh/pXoESLV6j6qDV+fIWi2xC0nzYOcLAT
        4Pnmo4oCfZo9dKpn1ngCBPLxu6Z7NXcmLhBD/HeOtJywT70gHepaExfdh3uHlmvZOZJmi2yG2zl+W
        LKNafEuIyje4w2tmuSAaKeV1givhknsT/osRnmh47/6Vi3UaWZPbLr/itOUmKjaHxXjY+ZZLiDJzG
        LOfdsBcJg==;
Received: from [41.215.171.102] (port=57237 helo=[192.168.1.2])
        by sgp65.siteground.asia with esmtpa (Exim 4.90devstart-1178-b07e68e5-XX)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ifxU8-0001M6-C1; Sat, 14 Dec 2019 10:48:48 +0800
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hello
To:     Recipients <fantasie@fantasiechocolate.com>
From:   fantasie@fantasiechocolate.com
Date:   Fri, 13 Dec 2019 21:48:18 -0500
Reply-To: jackharg231@gmail.com
Message-ID: <E1ifxUL-0006Er-AK@se5.mailspamprotection.com>
X-Originating-IP: 77.104.150.195
X-SpamExperts-Domain: sgp65.siteground.asia
X-SpamExperts-Username: 77.104.150.195
Authentication-Results: mailspamprotection.com; auth=pass smtp.auth=77.104.150.195@sgp65.siteground.asia
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.60)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fi3oD8HEy9ysrsB6Ile+oipSDasLI4SayDByyq9LIhV8Nw6Pyvi7hFS
 tMhEMixUdETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3K1rlWZ7KsbJGlvR3zjIF+drVb
 BjDTgyM8NEbQuMF2Zl1KVTPchkaHSnwVBzV26bwXPEq3BW2Q1N2nDvEbkyl2hR/DX/Zaxm8DTZcv
 9Lo6AUjuZpJZEjADIdDXWRxN1V7KL2PU8HU7XNtoJgIjzehPdFdVVHERpKFeuot+ySG3x/3WPpo0
 tvyqwhe4KkZih/awsOCXPGB5bFjRUM6xpNxIhiKQTD8WSW94avbQf/fuPhAOMZgeI44L/nmZbkvJ
 iiTLI9JXiIh4uBYiGWU3EW9EWnziP+lF0zId2orf3zYg7aRJ8NILbKp3z99V4ggaaNz0KfEFvfFC
 8oeMrIo7I8nwymHvDWISNKxbV05+v3H8PZ8VqzhivAQrd5oDlFTuTC+ENwFKZpHLY+QkE/XwwSMc
 OhWAHSct530lh7WIU190uaZKAYJDRFM/Hl+kuumFCdEN9YlMj9MNFjfZ7vF2DrOdGBcwzzAiqxcH
 FkuKWm+nttltiaAd5YPQ3sTObQHz3uVkTfukJ6AbGkj0AZzdbVwHLeAY+F7W1V8UpNirvz2hI90w
 k6txKqKhS6w0HRi9PxE/2M+kQvpk5ErCs/lAXyUagqOlcnu8Fm3CMFWoufzMWGQp5dTrZXGM20ID
 L4YNKAAiop61VLFR0Nl+f38EjKyyJr0BCrGjK5Qv4/DXDHzyyiYQKAuBFKPFgzRUfuWlLVBWmdsm
 JOjO+9tdLYGLx9ZHv6PH/NJ1Zw1LC8dFPHOLsgeTjMijr2pxD/ZfwnoeFm1TJZMbKHsWFNSYDBAc
 03IxtMUyZVcy8sSO7xlCvcyEMn/Y6PifEWAtrqjndSw0EzTTcK9SoUaJ7TroEO0mCjf9zYzIacMi
 lJyGVyjpEgOg2D82OBfhRc9COfUirYBk/SqqlnasV9oZUF7A3DHlViiCOocix7DZnTk7jJTvixTj
 MZCKpBSTVc60G/M6lZe60Mp4+bYz1Mj7dn5f7bSUkP2T88BhM9OQblUv8SSiVCrM2q6xXbrPMHna
 fCCzRaO8FW1xRQmUCt1z6/SrhtYfdOd6leD4cv6iFVGlwDyE4rmUTHx3aDcXj2YGejNYSUsylq13
 hNBU6npVXboYR6Zu1j7vYbbyRD5VWi87vNFCDnh7feDW234WWv1OfFlVoByfKSBpIK/1NH5THMtl
 YvyHAYGOGloDUooUzeRZU0q1JuPblJFrAKOEIUC4H2GTtPLaGz2x9K9hHwuG0yhRxA+rWCkK99UZ
 9RjpB8sOJH5jPs0sctPbpVCKaTF7icoJEdX/5dHNw2XVkItbgWQych5kF0GXpTudHZi83/1iSbyi
 r88PeO525yU4tGuvd7EqZwfenJLhJQOC7cV7ozd3p6apW5ECevjvHJ3epIxTx5UQQNivGBSgEWlW
 vssHPMzkXJTiG9LoXylUlInRIiwXI3exhK42M1juIKJIV/Ow4QjzWyxs1YOFwrFHSnnvu7lVZuQl
 9lujBtzjhuJlT7oIhbg7255kkrQFyLkl4wnoBHps7qAeU3OPMXc53J1OpNzzWUnwbEABatgMOqpn
 g97IYKkR/ztA/U5bjzl8z1qE0NW1DGEH+stfopq+OS5DvVmTgNUbK3FZV9ECIyIwp9c70LlMQgcO
 CfCViFxvtMOCcPjqW9RDxa1lAtdE6CtP3s3QJQaMWY9PXWw9ZyYhrutr5xPELEJSmeSe1tzKxDGK
 DI5aXXFqT0w=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Are you available?


Regards
Jack Hargreaves
Broker/Financial consortium
