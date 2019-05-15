Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBBD51EAEF
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 11:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbfEOJab (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 05:30:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:43404 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbfEOJab (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 May 2019 05:30:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 02868AE29;
        Wed, 15 May 2019 09:30:29 +0000 (UTC)
Message-ID: <1557911856.2950.10.camel@suse.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
 AMD boards.
From:   Oliver Neukum <oneukum@suse.com>
To:     "StarostaCZ@gmail.com" <starostacz@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Johan Hovold <johan@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org
Date:   Wed, 15 May 2019 11:17:36 +0200
In-Reply-To: <4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
         <20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
         <8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
         <4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mi, 2019-05-15 at 09:54 +0200,  StarostaCZ@gmail.com  wrote:
> Hello,
> can I still help with this problem? It's very important for us. Thank you.

Your first step would be t verify whether your kernel has the
fix coming in the patch Joerg mentioned.

	Regards
		Oliver

