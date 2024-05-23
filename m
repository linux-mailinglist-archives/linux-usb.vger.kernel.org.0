Return-Path: <linux-usb+bounces-10424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D98CCC6D
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2024 08:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8ECA281A78
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2024 06:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AD413C8FB;
	Thu, 23 May 2024 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ih89tDp/"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A304E13C3F5
	for <linux-usb@vger.kernel.org>; Thu, 23 May 2024 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716446756; cv=none; b=FU9/A1spAY7NoNa9vSgM3JRJdFUTKe6teQdPm26paUKMANZypSX/BPvzG89yezaREFXihmeWZAMLY3hENF2CmFMpTNnKLWDSwnE4t8/kyUO2c/1oc8TMXSF2M7ptkP6vey8J/BT8xIHZ89L2WCyo6LwWNf3K9NOBGr3FauXawCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716446756; c=relaxed/simple;
	bh=QOge68Fw0tzENrc52wcXLnWTfYP7hBED4uLrPeCT0dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7WRmin7i2VKymWSJpStOMvzIqZaayvRSOZJUQCCJ1iLjJG1ymLu8sSsWYe+DgF0FYhS9Guh6+XvZ1+rya933w04V7GkE2uDLzKwxL3kgFuxWNm260cgJGEt/zuZfS9Cm9F3WRQlFTv8OmTzIrPv3oxCkR56wIj24JUp78zFtyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ih89tDp/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716446753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDmW+1GQHZyT/E1Y2bedeCzyZRugpccl1pSBaP9FTL8=;
	b=ih89tDp/cfjMpGZ3yi1/O+NEsGQOkQxbybnpIBLbDIuhLlJhPwZYDGY/Ua6VLGJH95Tsjm
	VkV+huxG8+tW0vZ5/DujOAJ44RrEi7A12scaP4YSqEawVIGHBD13sq0lJCSkhMzIxIZxQ5
	jl8g1VBWojdM7cv/V5OyAuuei3kna0c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-37Yvtka0PjOESfXu_snMHA-1; Thu, 23 May 2024 02:45:51 -0400
X-MC-Unique: 37Yvtka0PjOESfXu_snMHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79410185A78E;
	Thu, 23 May 2024 06:45:50 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F13181C008BB;
	Thu, 23 May 2024 06:45:47 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: yongqin.liu@linaro.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	inventor500@vivaldi.net,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: usb: ax88179_178a: fix link status when link is set to down/up
Date: Thu, 23 May 2024 08:45:45 +0200
Message-ID: <20240523064546.7017-1-jtornosm@redhat.com>
In-Reply-To: <CAMSo37V5uqJ229iFk-t9DBs-1M5pkWNidM6xZocp4Osi+AOc1g@mail.gmail.com>
References: <CAMSo37V5uqJ229iFk-t9DBs-1M5pkWNidM6xZocp4Osi+AOc1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hello Yongqin,

Again, not a lot of information from the logs, but perhaps you coud give me
more information for your scenario.

Could you try to execute the down interface operation, mac assignment and
the up interface operation from command line? 
That works for me.

Maybe some synchronization issue is happening in your boot operation.
Could you provide more information about how/when you are doing the
commented operations to try to reproduce?

Best regards
José Ignacio


