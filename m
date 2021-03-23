Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747CC345CC5
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 12:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhCWLZ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 07:25:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:49144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231137AbhCWLZr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 07:25:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D24C61879;
        Tue, 23 Mar 2021 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616498746;
        bh=iOF6/QxVN6ra6df5o+JRIkeYQBV3jfQF0+QEuHFbuh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qtoTFcZ/YFueRFHQfu3WwmxiTFixWUv2uVSmJj+2VQf8RboubFHFe61i4SYmjmJjR
         mGjXuQWLoRePNY+Yoq8sIHH5DqkA9a9awu+c4iKsFUcLIVdRV2JZ0j02XNdZonFT59
         XlBjt4jU1ot0qxXRTo/UIub68mVNSbDpA5xeEMoU=
Date:   Tue, 23 Mar 2021 12:25:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 3/3] usb: dwc2: Prevent core suspend when port connection
 flag is 0
Message-ID: <YFnQOLDtYISWq7Wb@kroah.com>
References: <20210318061333.D6F9CA022F@mailhost.synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318061333.D6F9CA022F@mailhost.synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 18, 2021 at 10:13:32AM +0400, Artur Petrosyan wrote:
> In host mode port connection status flag is "0" when loading
> the driver. After loading the driver system asserts suspend
> which is handled by "_dwc2_hcd_suspend()" function. Before
> the system suspend the port connection status is "0". As
> result need to check the "port_connect_status" if it is "0",
> then skipping entering to suspend.


As before, is this a bugfix and needs to go to stable kernels?  If so,
what commit does this fix?

thanks,

greg k-h
