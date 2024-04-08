Return-Path: <linux-usb+bounces-9078-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2189C883
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 17:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ECA91C23F90
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 15:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925D01420D3;
	Mon,  8 Apr 2024 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dWOLiXgy"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB91419AD
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590701; cv=none; b=OjfVDxRu2sR6KOyWOPv4r/Q/uvO6E66DG6aIlSW+774s4YhuJ/X1cY//kSmN130TShRvZUR1RhJoxnzUKvHIIjvn0XlwLAq4SyybQNl3XINQAt/ya3vFKDET6g38c1cPSDwSQY1M2I+byjeIwMxid5YD4sfkMUtADvwka8D9Md4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590701; c=relaxed/simple;
	bh=6IXLTjcd6JqGOQbMDKa8PWG/UBTHXWFqxs/wZfO8js8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAcg6ZccMRAmjLYnqi4aaKcfa99AS2PNxi2aCIxZy7T80rqCSghLUomxFg9hIgGR2HfMIbODcgGuku7zbpbPOSvUvGZppro0VZKMNwhY8ai6335zv2sRnNHxtCS6ElXtyfOhMAmHvKVq1D7OyM97nvSfRM3yS38hTKxSxS9Fswo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dWOLiXgy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712590698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IXLTjcd6JqGOQbMDKa8PWG/UBTHXWFqxs/wZfO8js8=;
	b=dWOLiXgysnLN6F/aevZTHRJkzYUSCVGFgovy8JuZp8xukwEwOZ+VKUWkQuv3CAYCn0mSWt
	foAokAIBI1am5QjY8AIzllPlFcgOfwUzBMaUgDv2Q/3gSDHv7BcTALjGqjd5SPYZEBhCYT
	9PiU6yyEHdqtOGj2CBBsReSIw8j4VC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-x-K6YrKdNeuyXnMuSmr1WA-1; Mon, 08 Apr 2024 11:38:16 -0400
X-MC-Unique: x-K6YrKdNeuyXnMuSmr1WA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D935800219;
	Mon,  8 Apr 2024 15:38:16 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0012F492BC7;
	Mon,  8 Apr 2024 15:38:14 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jarkko.palviainen@gmail.com
Cc: jtornosm@redhat.com,
	linux-usb@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [REGRESSION] ax88179_178a assigns the same MAC address to all USB network interfaces
Date: Mon,  8 Apr 2024 17:38:08 +0200
Message-ID: <20240408153809.620467-1-jtornosm@redhat.com>
In-Reply-To: <ZhFl6xueHnuVHKdp@nuc>
References: <ZhFl6xueHnuVHKdp@nuc>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Hello Jarkko,

So, you are using two (or more) devices in the same machine and they are
not getting the specific one and even they are getting the same locally
administered address (random).
It is strange that the second reset is affecting, because the read and
previosuly stored address should be the same with one reset or with two.
As the author of the commented commit, let me analyze it to try to fix it.

Best regards
José Ignacio


