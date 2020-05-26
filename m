Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F411E20BF
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 13:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388746AbgEZLQy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 07:16:54 -0400
Received: from smtp2.math.uni-bielefeld.de ([129.70.45.13]:51914 "EHLO
        smtp2.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388712AbgEZLQx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 May 2020 07:16:53 -0400
Received: from math.uni-bielefeld.de (kvm01.math.uni-bielefeld.de [129.70.45.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 333436029A;
        Tue, 26 May 2020 13:16:52 +0200 (CEST)
Date:   Tue, 26 May 2020 13:16:51 +0200
From:   Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
To:     linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: Re: Kernel Oops in cdc_acm
Message-ID: <20200526111650.GA23478@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
 <1590409690.2838.7.camel@suse.com>
 <20200525191624.GA28647@math.uni-bielefeld.de>
 <1590480528.2838.24.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590480528.2838.24.camel@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum wrote on Tue 26/05/20 10:08:
> Am Montag, den 25.05.2020, 21:16 +0200 schrieb Jean Rene Dawin:
>
>
> Hi,
>
> good, so the primary bug is fixed. I will send it upstream.
> May I include your "Reported-by:" to give you the deserved fame?
Yes.

> Yes, I know. It sucks. But I cannot tell that it is the same device
> in the kernel. Nor can I reestablish the connection, as it is done with
> AT commands. It also means I cannot support reset_resume(). It sucks.
> Any ideas?
Not really. I will have to check if the ppp daemon can handle that.

Regards,
Jean Rene
