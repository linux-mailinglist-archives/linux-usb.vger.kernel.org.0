Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10E5D4B8CB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 14:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731872AbfFSMjL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 08:39:11 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46981 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfFSMjL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 08:39:11 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so11963238lfh.13;
        Wed, 19 Jun 2019 05:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k1hQu5XF69cIYxxFB0cBywmRgl9yaZZCT4nTwvJSezk=;
        b=ZkK+ICs+K3cGqcGKhT0r8c3lt2CQNDHzvWvy6vyp9E0QOZR7NXRT8q3bo9/EzOHJRN
         v4qIjmEtrlctiHdMQDwjrVSu1lohreVTRzunpzYiIu6+nZ2xnyFi8N0nO3LLB9c40vSM
         wpp0vvgRmBX9xsnxLr3gA5qCX7PAHtY3l5oLWEHmdcFgG4uCuaTYS3ah5DJih1TLOPLt
         AustNqgDGuBicQluyi2Qxoyo+NCNgs0cbhPe64UV/WWMk4FbJBTt78HQlRIta38xq+uJ
         KPl5TRDn81RYu0k8O6tsmdhouxrqUhTGnnH9myRPYNZugb6q9yR0dC22zGYS6FCaQrao
         VDcw==
X-Gm-Message-State: APjAAAV8ZTAhPfbs1/kGjbDFUHLVHHq+aLoBbhPpVAv5WphS+rOnrtfN
        Zo9+HXQNEyRQhMrE7NSoNNY=
X-Google-Smtp-Source: APXvYqy8ehN7nubUh2RfrodRbelb0zkjhgIBNB4apnSPdFi9hffzisYfFg8LfwrrGQrJ+IuOQhW90g==
X-Received: by 2002:a19:ed07:: with SMTP id y7mr65146320lfy.56.1560947949245;
        Wed, 19 Jun 2019 05:39:09 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id b62sm3036301ljb.71.2019.06.19.05.39.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 05:39:08 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hdZrl-0001Yw-No; Wed, 19 Jun 2019 14:39:05 +0200
Date:   Wed, 19 Jun 2019 14:39:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 14/22] docs: usb: rename files to .rst and add them to
 drivers-api
Message-ID: <20190619123905.GF25248@localhost>
References: <cover.1560891322.git.mchehab+samsung@kernel.org>
 <c05aecb424e4f835e3f7872ecb5818e1d2f3267c.1560891322.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c05aecb424e4f835e3f7872ecb5818e1d2f3267c.1560891322.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 18, 2019 at 06:05:38PM -0300, Mauro Carvalho Chehab wrote:
> While there are a mix of things here, most of the stuff
> were written from Kernel developer's PoV. So, add them to
> the driver-api book.
> 
> A follow up for this patch would be to move documents from
> there that are specific to sysadmins, adding them to the
> admin-guide.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Johan Hovold <johan@kernel.org>
