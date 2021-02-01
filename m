Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040B630A377
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 09:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhBAIlC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 03:41:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:46500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229736AbhBAIlA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 03:41:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAB3A64E33;
        Mon,  1 Feb 2021 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612168819;
        bh=XP5p+DxmYN1aSPOpvLeuWmYmh022JCv/Fe8sFsuEePM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p9A0dPSRV+qgEiKbxWDt4isL6Y9Yz6niLFrJArxllALaeF07OGXmXStq/ztj50Dfz
         mrA9eRATT6656FZHPp4KGieze0aPsw6WH3rnzJQiC6K5k6FA4Bkq7g2gSqiuqIVQXZ
         cb4XjnZPMDd5frPx+DKY5VuY+7/E1Nc/WyN5dyLfr/+c1jSEGvX2SiflAahPYbb29t
         ZbfYUDbs9Jy4SOQe2+toPcb0i4sQtFbm6HsfbbKwbWIKUVg0Jru+dHnuvpDe8FHwf+
         WnMI3DiKl5RT4RCBIg1G6fNZoOpYf31icTuwFqPetyjbGzzV8YGEPDRjOKYK5y6Vvb
         lG9BWoaLQyhcw==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l6Ul4-0004Iw-J8; Mon, 01 Feb 2021 09:40:31 +0100
Date:   Mon, 1 Feb 2021 09:40:30 +0100
From:   Johan Hovold <johan@kernel.org>
To:     "Pham Van Thanh Tung (GAM.VN.DAP)" <TungPVT@fsoft.com.vn>
Cc:     "Nguyen Duy Hung (GAM.VN.DAP)" <HungND3@fsoft.com.vn>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Tran Van Pho (GAM.VN.DAP)" <PhoTV2@fsoft.com.vn>
Subject: Re: Bugs: usb serial crash when close second comport
Message-ID: <YBe+fqo+V5mhGXme@hovoldconsulting.com>
References: <PU1PR06MB2117988A6B7680CA1806DBE091B69@PU1PR06MB2117.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PU1PR06MB2117988A6B7680CA1806DBE091B69@PU1PR06MB2117.apcprd06.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 01, 2021 at 08:31:13AM +0000, Pham Van Thanh Tung (GAM.VN.DAP) wrote:

> ***********************************************************************
> IMPORTANT NOTICE
> This email may contain confidential and/ or privileged information that belongs to FPT Software. If you are not the intended recipient or might have received this email by accident from an unreliable source, please notify the sender from FPT Software immediately and destroy this email. Keep in mind that any unauthorized copying, editing, disclosure or distribution of the material in this email is strictly forbidden, plus against the law by which FPT Software and involved clients abide.

Please resend without this footer, otherwise there's not much we can do
to help.

Johan
