Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF15A12D6D6
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2019 08:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfLaHf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Dec 2019 02:35:58 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43548 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfLaHf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Dec 2019 02:35:58 -0500
Received: by mail-ed1-f67.google.com with SMTP id dc19so34646898edb.10
        for <linux-usb@vger.kernel.org>; Mon, 30 Dec 2019 23:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ccn4ine5pQTGt/0xdjZzGvDGIlhfYjgXz7nS/eVcR/M=;
        b=D7PwjabZ1I3k4J5FsEqVL6N9dfL571uM2Q02CST+m2zqnUy5JtjAvidCykHt453Lco
         uz9w94D8QduXojvkZeOE8nVpve/licSSULEe87EhonP1RmSYtUlNPq3mGWSyPzbP/VO6
         tPAdbCPhdo7X7GtWIAiIdLT4/EGKhQywts92Y6pWnzbUj+kI4cgo001I+aU9VJ8FImh9
         Y7L6imlutK2jfTNiam1uMSeaI8UgHbXT2nZJK3d0PECw0NSLyTIam7eeed+R9YcnIT3J
         9gDXMMTZhkF+K3CuZCUe1FPvkLXYuGFuaD6hMdCRQGdsPINT3nBeKHIkdRPFviFnvToH
         RiLg==
X-Gm-Message-State: APjAAAX21J9F3l0haycW/nxuDWEUCl/66nSB4kUTgz5jIfUUIW0W2FaY
        Hr0TBriaPChRWefj2YRlp8A=
X-Google-Smtp-Source: APXvYqzAzouYvOMt2kG9f3g6W7OxW1n4ShNwx425msJ7hlqhDE5BNdozIhPmY+b+9h9cckHhSLeaCw==
X-Received: by 2002:a50:fd93:: with SMTP id o19mr75680597edt.28.1577777756061;
        Mon, 30 Dec 2019 23:35:56 -0800 (PST)
Received: from pi3 ([194.230.155.138])
        by smtp.googlemail.com with ESMTPSA id d1sm6089482ejy.3.2019.12.30.23.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 23:35:55 -0800 (PST)
Date:   Tue, 31 Dec 2019 08:35:54 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usb:usb-testing 36/40] drivers/usb/host/ehci.h:767:3: error:
 implicit declaration of function 'writel_be'; did you mean 'writeb'?
Message-ID: <20191231073554.GB6747@pi3>
References: <201912311154.owbSJLjy%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <201912311154.owbSJLjy%lkp@intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 31, 2019 at 11:08:14AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   51d22e855ea3459d4b272e46aff95de0e59e65a7
> commit: 88eaaecc44461f9fb147bf7ee6ccc6d4e9fc23e0 [36/40] usb: host: Enable compile testing for some of drivers
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 88eaaecc44461f9fb147bf7ee6ccc6d4e9fc23e0
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/usb/host/ehci-platform.c:37:0:
>    drivers/usb/host/ehci.h: In function 'ehci_readl':
>    drivers/usb/host/ehci.h:743:3: error: implicit declaration of function 'readl_be'; did you mean 'readsb'? [-Werror=implicit-function-declaration]
>       readl_be(regs) :
>       ^~~~~~~~
>       readsb
>    drivers/usb/host/ehci.h: In function 'ehci_writel':
> >> drivers/usb/host/ehci.h:767:3: error: implicit declaration of function 'writel_be'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
>       writel_be(val, regs) :
>       ^~~~~~~~~
>       writeb
>    cc1: some warnings being treated as errors

Indeed, the USB_OCTEON_EHCI should not be compile tested on all
platforms but only these having readl_be. I'll fix it up.

Best regards,
Krzysztof

> 
> vim +767 drivers/usb/host/ehci.h
> 
> 91bc4d31e81b15 Vladimir Barinov       2007-12-30  737  
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  738  static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  739  		__u32 __iomem *regs)
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  740  {
> d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  741  #ifdef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  742  	return ehci_big_endian_mmio(ehci) ?
> 68f50e52554a0a Al Viro                2007-02-09 @743  		readl_be(regs) :
> 68f50e52554a0a Al Viro                2007-02-09  744  		readl(regs);
> d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  745  #else
> 68f50e52554a0a Al Viro                2007-02-09  746  	return readl(regs);
> d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  747  #endif
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  748  }
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  749  
> feffe09f510c47 Peter Chen             2014-01-10  750  #ifdef CONFIG_SOC_IMX28
> feffe09f510c47 Peter Chen             2014-01-10  751  static inline void imx28_ehci_writel(const unsigned int val,
> feffe09f510c47 Peter Chen             2014-01-10  752  		volatile __u32 __iomem *addr)
> feffe09f510c47 Peter Chen             2014-01-10  753  {
> feffe09f510c47 Peter Chen             2014-01-10  754  	__asm__ ("swp %0, %0, [%1]" : : "r"(val), "r"(addr));
> feffe09f510c47 Peter Chen             2014-01-10  755  }
> feffe09f510c47 Peter Chen             2014-01-10  756  #else
> feffe09f510c47 Peter Chen             2014-01-10  757  static inline void imx28_ehci_writel(const unsigned int val,
> feffe09f510c47 Peter Chen             2014-01-10  758  		volatile __u32 __iomem *addr)
> feffe09f510c47 Peter Chen             2014-01-10  759  {
> feffe09f510c47 Peter Chen             2014-01-10  760  }
> feffe09f510c47 Peter Chen             2014-01-10  761  #endif
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  762  static inline void ehci_writel(const struct ehci_hcd *ehci,
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  763  		const unsigned int val, __u32 __iomem *regs)
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  764  {
> d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  765  #ifdef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  766  	ehci_big_endian_mmio(ehci) ?
> 68f50e52554a0a Al Viro                2007-02-09 @767  		writel_be(val, regs) :
> 68f50e52554a0a Al Viro                2007-02-09  768  		writel(val, regs);
> d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  769  #else
> feffe09f510c47 Peter Chen             2014-01-10  770  	if (ehci->imx28_write_fix)
> feffe09f510c47 Peter Chen             2014-01-10  771  		imx28_ehci_writel(val, regs);
> feffe09f510c47 Peter Chen             2014-01-10  772  	else
> 68f50e52554a0a Al Viro                2007-02-09  773  		writel(val, regs);
> d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  774  #endif
> 083522d76662cd Benjamin Herrenschmidt 2006-12-15  775  }
> 8cd42e97bf451b Kumar Gala             2006-01-20  776  
> 
> :::::: The code at line 767 was first introduced by commit
> :::::: 68f50e52554a0a55dfe2e3fdf659ee0569d73c3f [PATCH] hci_{read,write}l() does force casts to wrong type for no reason
> 
> :::::: TO: Al Viro <viro@ftp.linux.org.uk>
> :::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>
> 
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology Center
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation


