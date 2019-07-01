Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF8E336551
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 22:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfFEUWj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 16:22:39 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33826 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEUWi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 16:22:38 -0400
Received: by mail-qk1-f194.google.com with SMTP id t64so82070qkh.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hdVKMo8506TgrZK1PYQwv5IIzq/3ub7YoF/TJnHz4iQ=;
        b=jn33M/OLPMrHDhWB/oB3uBW6KyUZwZ3dHbeuh1XlGJHpj6dwZhMsOO5OOrjM6STAk4
         qROquiS6fMH0HrsaHJQe7IWfco1/3CwVA1Gz+FGmFpUONVqiEw31nfTAMmDzWlOeuUEZ
         mk6d5RDBk04fmPauqpzDR3UBYRMhcvzlsYSc74mHKl9XePav6wRDF+ORoRV2fKHFG/sb
         cUQUGUyyBaCwXiDs4NT1HvJhutfWYLBEeCwb+RHe4UP0YFMmyv3lmlZz7HJMeHb2peh0
         c0KHydFemqtXhwO8HH1TOYZIPA8HQnsiNT2WYwoU7yhfgAcf8QGzWgN4SKzBFML0mJnJ
         tpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hdVKMo8506TgrZK1PYQwv5IIzq/3ub7YoF/TJnHz4iQ=;
        b=t5avSZ+eNL28xcRMpWuOAlFr/ebZjlxXt++WLV8t0KdgcbJqVTLLGY/i4kdYGr2Tc8
         sOju0QNvgEHCmZPpRZkJTR+WvGrxKd+okk76hECtxSLvI8CP1s0f2AMdERyikXOUw/PO
         U4gErNmJYOquMUXyX11GSiI/TJH2DwzM5WKBrywowViTCA1dZ8sAibyL1i+Cnz7QZ40u
         smTKc02VHn6IaU5/tOqzEGuCfSxi/HhfKm/Uo7io4wgBgQNhavyZe9qiKchxzKRLSZ/x
         Q0/KneRmV4Z4fIKdUyIGCD5SZz7zxMihp0/W3Mijpu59A5Hs1mIaFHqknollOycWtLjK
         g+BQ==
X-Gm-Message-State: APjAAAX7gGwrpsuwu3fshY1THWxLW+Asn5Xmjcme4VL5DtnbJuHJjAWz
        XghM5I33kg3FaEIzJbgsCf8g2g==
X-Google-Smtp-Source: APXvYqzsyiPSTmn82JkgPtH+Z1+lnK81jan/CvvnzRGGA4oYrI2ETBGBe6mNB1mjYk7SLXHnNDomow==
X-Received: by 2002:a37:6312:: with SMTP id x18mr35736460qkb.300.1559766157655;
        Wed, 05 Jun 2019 13:22:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id v9sm884883qti.60.2019.06.05.13.22.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 13:22:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hYcQd-0002uk-Vd; Wed, 05 Jun 2019 17:22:35 -0300
Date:   Wed, 5 Jun 2019 17:22:35 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>, Sebastian Ott <sebott@linux.ibm.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Max Gurtovoy <maxg@mellanox.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>, linux-block@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        megaraidlinux.pdl@broadcom.com, MPT-FusionLinux.pdl@broadcom.com,
        linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] IB/iser: set virt_boundary_mask in the scsi host
Message-ID: <20190605202235.GC3273@ziepe.ca>
References: <20190605190836.32354-1-hch@lst.de>
 <20190605190836.32354-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605190836.32354-9-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 09:08:31PM +0200, Christoph Hellwig wrote:
> This ensures all proper DMA layer handling is taken care of by the
> SCSI midlayer.

Maybe not entirely related to this series, but it looks like the SCSI
layer is changing the device global dma_set_max_seg_size() - at least
in RDMA the dma device is being shared between many users, so we
really don't want SCSI to make this value smaller.

Can we do something about this?

Wondering about other values too, and the interaction with the new
combining stuff in umem.c

Thanks,
Jason
