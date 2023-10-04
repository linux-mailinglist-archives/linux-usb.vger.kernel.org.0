Return-Path: <linux-usb+bounces-1071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46977B7EF5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 14:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9DDBA281781
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 12:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8462813AE3;
	Wed,  4 Oct 2023 12:23:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5648477
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 12:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3372CC433C9;
	Wed,  4 Oct 2023 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696422180;
	bh=SU0MckY9k1pF5W9aPuV80up0uErfuNTiFTCvqjtVmVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xwZ/Z2/ge/zphlf/p8xZLwO4pn/DlYTp/vPkcZYqQ0LEaVgw20/b7KBWFzGJrqJ75
	 2rZvI5UDDOLqpRr6dmoHe225qKKuccXPnSJfYZfvvKYmsTJSXMKaxoa6N5uqlzsKJ2
	 KFVEz5AaVHYuUl3QSov6XOGaIfu6TMJ1tM12RZs4=
Date: Wed, 4 Oct 2023 14:22:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Jack Pham <quic_jackp@quicinc.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v11 00/13] Add multiport support for DWC3 controllers
Message-ID: <2023100421-cape-duct-7e1e@gregkh>
References: <20230828133033.11988-1-quic_kriskura@quicinc.com>
 <0814b6a2-c52d-4be2-ae06-8391767ac144@quicinc.com>
 <e58ec88c-142d-49d2-875a-4b5c90929d31@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e58ec88c-142d-49d2-875a-4b5c90929d31@quicinc.com>

On Wed, Oct 04, 2023 at 01:10:29PM +0530, Krishna Kurapati PSSNV wrote:
> Hi Greg,
> 
>  Thanks for picking first 3 patches into usb-testing branch.
> 
>  Can you help pick patches 4/5 of this series as well into usb-testing (I
> checked and they apply cleanly) so that I can fix comments and rebase
> patches starting from 6 to 13 in my v12.
> 
>  Patch 4 been approved yesterday by Thinh and so far no kernel build bot has
> reported issues on these 2 patches for any configs (on v9 / v10 / v11).

It's hard to pick up individual patches, especially with acks from
others.  Please just send that one alone with the reviewed-by and I can
pick it up that way.

thanks,

greg k-h

