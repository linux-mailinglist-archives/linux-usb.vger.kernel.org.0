Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C788EBA0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbfHOMgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:36:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfHOMgp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 08:36:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E3ED2083B;
        Thu, 15 Aug 2019 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565872604;
        bh=2wI3jmd78SLhKRK87BQjM2motI1weTlW8uLgnGnTkVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s4t/cNjfF6MX+6sqQCd83+JleHuuR07ITxS+/tBCy31knXaaOtQ8qsTCKs1m0SsPE
         TNCJlhSOkdHCcUvxpDN2EGcSiVRgVskKxZJrfonBDlusX83Xal/fW9+/YezEWugIf6
         v9BHCvnUsrz/IFEWnZ53WCuuoael6iNV2LfeQiA8=
Date:   Thu, 15 Aug 2019 14:36:42 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: host: ohci-pxa27x: Fix and & vs | typo
Message-ID: <20190815123642.GA29583@kroah.com>
References: <20180223123300.GA1062@mwanda>
 <20190814140414.GU1974@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814140414.GU1974@kadam>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 14, 2019 at 05:04:14PM +0300, Dan Carpenter wrote:
> I was looking at this code again today and I'm still convinced this
> patch is correct.  Should I resend?

Please resend, it's not in my queue anywhere :(

