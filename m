Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D668243D42
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 18:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgHMQZt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 12:25:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:58398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbgHMQZs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 12:25:48 -0400
Received: from localhost (unknown [70.37.104.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83BDA20855;
        Thu, 13 Aug 2020 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597335947;
        bh=of7dMgSb0gnqlXzJ8AuJFw089c7HDfcNNhLROmWvnJY=;
        h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
        b=RohbpgzcHwzp8/7aRxtqMBJc1QqQNktFD9JGegeJf5Dm2Fvp7BKLiue03Uo0Rrg3m
         soBPfy5lomON/zAQJgYHX/kGKbIBZjlS9C8s+cFzsW8QQP0H83cYPvrZxKMe/JYLWl
         M5oHrzkjs2bVjaGgw+Ua02+rUetLRCxJPUFrCi3s=
Date:   Thu, 13 Aug 2020 16:25:46 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Cc:     stable@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: typec: ucsi: Hold con->lock for the entire duration of ucsi_register_port()
In-Reply-To: <20200809141904.4317-5-hdegoede@redhat.com>
References: <20200809141904.4317-5-hdegoede@redhat.com>
Message-Id: <20200813162547.83BDA20855@mail.kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 081da1325d35 ("usb: typec: ucsi: displayport: Fix a potential race during registration").

The bot has tested the following trees: v5.8, v5.7.14, v5.4.57.

v5.8: Build OK!
v5.7.14: Failed to apply! Possible dependencies:
    4dbc6a4ef06d ("usb: typec: ucsi: save power data objects in PD mode")
    992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")

v5.4.57: Failed to apply! Possible dependencies:
    2ede55468ca8 ("usb: typec: ucsi: Remove the old API")
    3cf657f07918 ("usb: typec: ucsi: Remove all bit-fields")
    470ce43a1a81 ("usb: typec: ucsi: Remove struct ucsi_control")
    4dbc6a4ef06d ("usb: typec: ucsi: save power data objects in PD mode")
    6df475f804e6 ("usb: typec: ucsi: Start using struct typec_operations")
    992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
    bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
