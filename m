Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093BF79C50D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 06:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjILExD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 00:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjILEw3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 00:52:29 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FD8196
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 21:52:25 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c0d5b16aacso42432205ad.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 21:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694494344; x=1695099144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCJ8KYCXw7NsEnwWAsSLTHOcGDS6ZTh29m1HntYNSuU=;
        b=FdbvvfIW0kmjwVsHiDAJybHWkphj1tab5i6hOtlUdsGc5qUQ+c38QNk5lQD7DfdYcF
         ySC2axJ4p6LQhUfN8d1mMvaM8rV7NCOC9/+duS0jqUNtOXNAqge7cYJPOoF4+BMJZDop
         VDrtzSqUzN3/W/DiW1d7niPFDTWNlFQgV+NXMnRzxoU0JJyQuB6RYPjTL1I4dJ+2ld6G
         THlPk4S/uBMI4Ozhj3+kDz3i5rMiH9Td47F7/m/Ge8CPglxILw/KhTREmrvdDiqPAtWz
         wCrmcw4MTW1UEpDTHjzqc8SlMS/FOYP3y+K3E/fB6P+2+8SnoL4qXPQDCRAzX8dxsEid
         29rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494344; x=1695099144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCJ8KYCXw7NsEnwWAsSLTHOcGDS6ZTh29m1HntYNSuU=;
        b=MD/gMG8FfMvnz/F384AzYquVjt2bHcwk6f304Dhieg73fEihoNmwIZsOY9rEqPa17y
         AZBUmAZ/85UE2Ud3YoYYrpDaux1okbxt9XC9qiepCD3w2Y/V9eNpIHUy2ZUVYqDP3rL4
         UESYp7XbiiPC89UA4qDuYQx5uwHXjbfJmYeKAKl3pVGk2hvNHp0ndiWmCLwLW3/uMkRX
         A2dnhO3rvjWY2dRJQirEYYyKDNUqfKEdzQwMkIKmvG8f3x8KtquKJLw/U4tulBsD3Y7z
         wJ5MtqSj+YDtsvqMi2CkOn9otgn9QEbtTDXimKs02XbSuBFYHr1PT9XW54AOHxNUmje5
         iS6A==
X-Gm-Message-State: AOJu0Yyk7o4uNrIi415EwqVCCPdOuFryMbv38W925y6hnifgXQjQ0ti0
        9Y8Dslb790nRr3W091KyS9RV0w==
X-Google-Smtp-Source: AGHT+IHRq1eU5iRIzGmCghBvgIYt3a7PqHAy2No9rFqnep8OOZci3KUJmaop+aZPHxaXNMkKvIzKtw==
X-Received: by 2002:a17:902:f7cb:b0:1c1:de2b:e1d0 with SMTP id h11-20020a170902f7cb00b001c1de2be1d0mr8587539plw.32.1694494344236;
        Mon, 11 Sep 2023 21:52:24 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id p15-20020a170902e74f00b001bb8be10a84sm3398860plf.304.2023.09.11.21.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 21:52:23 -0700 (PDT)
Message-ID: <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
Date:   Mon, 11 Sep 2023 21:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in correct
 state
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
        nicolas@ndufresne.ca, kernel@pengutronix.de,
        Jayant Chowdhary <jchowdhary@google.com>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
 <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
Content-Language: en-US
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey Michael,

On 9/10/23 17:24, Michael Grzeschik wrote:
> The uvc_video_enable function of the uvc-gadget driver is dequeing and
> immediately deallocs all requests on its disable codepath. This is not
> save since the dequeue function is async and does not ensure that the
> requests are left unlinked in the controller driver.
> 
> By adding the ep_free_request into the completion path of the requests
> we ensure that the request will be properly deallocated.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 4b6e854e30c58c..52e3666b51f743 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  	struct uvc_device *uvc = video->uvc;
>  	unsigned long flags;
>  
> +	if (uvc->state == UVC_STATE_CONNECTED) {
> +		usb_ep_free_request(video->ep, ureq->req);
nit: You can probably just call usb_ep_free_request with req instead of ureq->req.
> +		ureq->req = NULL;
> +		return;
> +	}
> +
>  	switch (req->status) {
>  	case 0:
>  		break;

Perhaps I am missing something here, but I am not sure how this alone 
fixes the use-after-free issue. uvcg_video_enable still deallocates 
_all_ usb_requests right after calling usb_ep_dequeue, so it is still 
possible that an unreturned request is deallocated, and now it is 
possible that the complete callback accesses a deallocated ureq :(

Regards,
Avi
