Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1E7AA7E95
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 10:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbfIDI5l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 04:57:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42049 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfIDI5l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 04:57:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id q14so957844wrm.9
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2019 01:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=A6tCn/bL9VqC8vfSP/XnAcqw4FN3+q77kJ2LFpOO3BI=;
        b=tDMIAcZLguralxlzTEyQXyz646kZS1T8wxb1c3TUtS0zhjFyN0bfZ0qmHh+anvKoS+
         enPYK112jjWRrLYQKMrK9FAV6Ol+a8t9mE27jgZSc6NH+8CDzzuVpzvbkxb1KazT7H6E
         IaEbW9VmHOLOXcli6Rp7Y7LPeTKC34geAOvmlUqCWd9271nPAcMr7PzTZXBYJOvPl3ce
         eGLEmEtTX1qgSHVHthfpLj2v2iI8pUBT5dfietW1C81dMAChU/xSklqH/Rf8WLcAdqup
         Vms5onTijGYyKHkeZOoESG3oZgynqZMQV5lndEaJ9q7DPo9NDx5Bn0YXNcf9A6HS7JWR
         LkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=A6tCn/bL9VqC8vfSP/XnAcqw4FN3+q77kJ2LFpOO3BI=;
        b=qYvlUvvhpzePB25q71m3k5tVX49rUqERQEHMzvp4LN0EedSAOTi4AL7Go351rFetun
         mwBajTddfDDtPabwOOYLi0EYWQmCNhki1CvXWrGD5sev9HCVx3kPOGzU8USuO6VF0o9X
         nceyGdjiL6gGantu5Dkms5s5adTpdI1ala7KyspjNRf07KPFWwBQ4GnDhA/zflGlKHgD
         NjkxPRUokyYeGTuwxaqLr2UiN2U/rZQy+y6B1VYo26DAD+gvN4fu8tAkXUUdnTWnQxAG
         yH9Ykc8WOqgvV104VpmGN+0zysnuKL2zNB+7mY+Oz/ku9AM9pE9NEyftioFOvhGEkcm1
         OnQg==
X-Gm-Message-State: APjAAAVEDb0gFXpsBdDHw/JsuNWzzQIQS6gW3jPWxAdvbjOBpONIqKMG
        8Wnkf730TAskuqMS+hJbn443f6rpKj0=
X-Google-Smtp-Source: APXvYqyAhrKvTsVxQ5mpExTe+xZfDqfG2f9kJKPUIqucia30GF+S+u8ulK8WdZil6mhTDfemari2lQ==
X-Received: by 2002:adf:f404:: with SMTP id g4mr46021135wro.290.1567587458844;
        Wed, 04 Sep 2019 01:57:38 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id u68sm3507042wmu.12.2019.09.04.01.57.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 01:57:38 -0700 (PDT)
Date:   Wed, 4 Sep 2019 09:57:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org
Subject: Re: usb dma_mask fixups
Message-ID: <20190904085736.GH26880@dell>
References: <20190903084615.19161-1-hch@lst.de>
 <20190903131648.GA19335@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190903131648.GA19335@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 03 Sep 2019, Greg Kroah-Hartman wrote:

> On Tue, Sep 03, 2019 at 10:46:09AM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > the first patch fixes the ohci-sm501 regression that Guenther reported
> > due to the platform device dma_mask changes.  The second one ports that
> > fix to another driver that works the same way.  The rest cleans up
> > various loose ends left over from the dma related usb changes in the
> > last two merge windows.
> 
> Thanks for these, all now queued up.

Did you queue the MFD patch too?

If so (and you can rebase ;) ), please feel free to add my:

Acked-by: Lee Jones <lee.jones@linaro.org>

If not, no sweat.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
