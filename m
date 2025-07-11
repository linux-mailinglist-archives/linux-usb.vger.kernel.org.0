Return-Path: <linux-usb+bounces-25716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F421EB01EE6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 16:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C5155A0A46
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 14:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6603D2E5B3D;
	Fri, 11 Jul 2025 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZgaXaJID"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A16A2E54B8
	for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243509; cv=none; b=UkrJTsgZ466Sg2JNGoGxTMI1LtAzjEfmIStyyzlHgr7fPQ1sqEhHqaPdOONd2HUcjZDSJufsi1+V4O/KEm/EzulPrf0sKy424Yvbe7HvFkanhXCEtSIldY168yxCyxLvmD3OcEjyVAu5ND848+8w7QuoRstjz0bHqgb2LgI2598=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243509; c=relaxed/simple;
	bh=F1WRWAekWQtZHnAi8bGdLi7p6cW0x9Nes/+TfR5/Bk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Go+QzhJXSBES7VPdjyifaOp8yRd8qGJIkf6GZUtKxUPW7a+R6H6JeuSgCX9QnlagBr/ufVHiG620TdTxLtPBSKrmWW9mHV+aRpJ8xk4ggRpcTr9sH66JEDKvIgs3Um8k0hhsEeWlqnKS89e1S2mvQBhU/TTsCPO3rtnu5o7tiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZgaXaJID; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so22390856d6.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752243507; x=1752848307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHTH7Vuga5ejUkTj7wZFe5xnlqa1x8LhOx/L5uy3tJ8=;
        b=ZgaXaJID9vMaf7OUDq/ZF1UPmPThJZ6lJMeSqdFv8qSAXSK9u5AsNGAQwV+TcOshG6
         Ax2cKKF2Dh5H6vicn4oEmRTdX+WSZLVpdgKAW9G5ScCFKSV75eeRUgxmogkod8dcyTV/
         gG9kagnBJXvQnukioF0+0FguPlF6sdfU2Qh74VF2ErkSkSq4VmxirP/A/FRLXay/trtw
         HTgpHWJWsSkxYfbz1ZCOwerKC/Vsu5bM7sJZywx6T62Dk9XDch1a/8tm9aH3pVrOOAvU
         V59bio8zZVd9Dz7WrCiu3RSnDhrPNvcHkq8k2NlvYTE1/jaht8fGtoZag1pt5nRUKCUx
         3K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752243507; x=1752848307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHTH7Vuga5ejUkTj7wZFe5xnlqa1x8LhOx/L5uy3tJ8=;
        b=umQUCTU3G8yy5zDV6IRga77ev6oVP4uzeO179BKB4c4XGPavOGbEbaKbtTeXD3SJPr
         oZwUzhvywmQ+hCjpAGWGUhmmFNhY4I5ccbSxe0JAiqGll99enOVVtS2Mi35S19g0excH
         i55+4qvFEHN339vVKVR4ULQEISxxzpyiVtteVp0ttfrFaDcQWYn7lVZwe/jOJE3AnysO
         7F3fVy2b1Ysr+rn7ppGXbd9v6e65FA+emY3rzVLnrU/9qde+HoikEFF90D28W8IupVhQ
         eRAteVlnzEPukqBZhvXTYRbfOcD9f1c0L6azuaGVwptvYEqRP+iDZrFHwKEaNvLRBE27
         o46A==
X-Gm-Message-State: AOJu0YzU1rJTmfZS3ZAl3ofbq4tuxbIRQ+EBK1tRkW68wgLYkQJ1H9tm
	mPyIT5y0t4PIW6vR8kWLOhaNVnr2ztmbhKMBrhs5sKHBaEKDh2OIhVjyijS8Gnoa7A==
X-Gm-Gg: ASbGncuq+OEtBGGzPp8XDKdQY90gIJBmQei/z7f6Jh5KGi8dbprJx9fxcJJd8Jx1Ugx
	XNjU+JptSr1j6CbttU4ZOhohFneZkXT++VIyCHDdnx94kqgkuSD8z+CHXR9BqDF4tkNw+tKxw8M
	kwSnUXXXmGWcl4D//5mLr8OuwWV7FtIZaH65f9oyqiUaqIj1Yq/l/eMtgy6SbuNOuXuLymmMSmE
	4X3b4pkTXmhCoZsqV5e0DKCMicGKODgOGTKwVTrT4aURoFsjgmHyNzYmAlzFFtG6wZdTq++AzPq
	Q5ggYAB7GBTFhM7bbPQS/Ujv6rlRfFuHd7KM5sRjqrAZRRmXhh0x0+azKrbIE47cpoY+TlEgRHV
	nBNG88ttCzv+8aiPF5bQe9t7jUqGykgdjcv2Qds2l4XVQl7x5i6Q=
X-Google-Smtp-Source: AGHT+IHU/emKwl2r5Gsfn2eSCOzvWx5Z0u+fK8xNQLhA1dsfDA0OUcsG+9XKJSF1ohNPCpyql2L55Q==
X-Received: by 2002:a05:6214:2b0e:b0:704:9840:b080 with SMTP id 6a1803df08f44-704a3612c94mr61250326d6.17.1752243506815;
        Fri, 11 Jul 2025 07:18:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d8eee2sm20123376d6.97.2025.07.11.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:18:25 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:18:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <50dc348f-1751-4fe3-b5d0-9336280f07b3@rowland.harvard.edu>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711083413.1552423-4-sakari.ailus@linux.intel.com>

On Fri, Jul 11, 2025 at 11:34:12AM +0300, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> isochronous endpoints in a USB version independent way.
> 
> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/linux/usb.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 68166718ab30..bd70bd5ca82d 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -2038,6 +2038,28 @@ static inline int usb_translate_errors(int error_code)
>  	}
>  }
>  
> +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> +					    const struct usb_host_endpoint *ep)

The name "usb_endpoint_max_isoc_bpi" is sufficiently obscure that it 
deserves a kerneldoc comment saying what the function does.

Alan Stern

