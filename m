Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7C311BC62
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 20:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLKTBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 14:01:14 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34956 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfLKTBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 14:01:14 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBJ1Bge008259;
        Wed, 11 Dec 2019 13:01:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576090871;
        bh=ZZRsEDLJgiL7dsl+Me+f97CR+seGCdEyMFX9lxZVsFc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Otd7YrSG90PX5bjJ7Bza3iaxf6d2ZJx+EowZgH6wI4oJ58TK3zQo50DKpU9HIc/XG
         nXNHl40toDkadMF369eyVtZUOsxyXYrMjLiRlNID1AIf9kM282wu4vG0A3PG4yz8Xg
         sbxfI8Nx2lbc+azGeZN8UDQ0piSTlufxuflE6eb4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBJ1BAY055375
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 13:01:11 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 13:01:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 13:01:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBJ1AqA107366;
        Wed, 11 Dec 2019 13:01:10 -0600
Date:   Wed, 11 Dec 2019 13:00:36 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <od@zcrc.me>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/7] usb: musb: jz4740: Silence error if code is
 -EPROBE_DEFER
Message-ID: <20191211190036.GG16429@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191210171110.62141-1-paul@crapouillou.net>
 <20191210171110.62141-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191210171110.62141-5-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 06:11:08PM +0100, Paul Cercueil wrote:
> Avoid printing any error message if the error code is -EPROBE_DEFER.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Queued for next v5.5 -rc. Thanks.

-Bin.
