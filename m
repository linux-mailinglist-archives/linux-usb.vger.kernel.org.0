Return-Path: <linux-usb+bounces-9422-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7575C8A7EAA
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 10:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14B9B1F230DA
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 08:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2C512B16E;
	Wed, 17 Apr 2024 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2SkK6on"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E3128383
	for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343921; cv=none; b=gfx844czi/qdh5atVrHFkTZxHLtOIl5JjWEUzbRL6ixA+7SlCWC9LcGhVbZGdZHdBrXi+h2WENJEW8Z4DCxxvdiP63rA6i8EtBK44jSbn+AIZtRKzG2LOXvNi6qtszu4yRwS8KW9Xo7yM9zQox/KuijHPVKdutMxfjYK7E3PmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343921; c=relaxed/simple;
	bh=nLrkFEe4Sr4UShI8ScNIyCYxlUJPK0uRjdjp8ONRmus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAaDMbQFhcxpackvAwIrzYXUC0O+QaI4wGN9sj3V6/Pnuvpu32tBaokRvc5CQ66dlCFZPoUX0x1kOwv8F7ShKbH/zUFtFu1aUbD60tv3AB7cdkQvaG8lZHMJSOH6dgz6cXaspFOkx2UMVJEunI7YFmQFjygN7oxq2+c18M01FRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2SkK6on; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713343917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dVPyrvg8jq+Af1WjENtNQaFsERndNa/U+D0gRrpnkiw=;
	b=H2SkK6onbc1zZeXvgLNK9zUWP/J5rXhbW7AnwC8gd1UYealXXCMBTqeFnK2ZbV1rFB2SIy
	u4SXr66pWgtokZ3lowDP7M4hbZd9BmftnwAXJoJbrszh5Ol2XurMf/wS/Hy3vU39auNHj+
	lAMC8rcuxbg/d0dUwIBFZEqjXwhzZwg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-MHldD08jNa-ffleAeYaAPw-1; Wed,
 17 Apr 2024 04:51:54 -0400
X-MC-Unique: MHldD08jNa-ffleAeYaAPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 764F028EC11B;
	Wed, 17 Apr 2024 08:51:53 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86208C0157D;
	Wed, 17 Apr 2024 08:51:50 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	jarkko.palviainen@gmail.com,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: usb: ax88179_178a: avoid writing the mac address before first reading
Date: Wed, 17 Apr 2024 10:51:42 +0200
Message-ID: <20240417085145.219405-1-jtornosm@redhat.com>
In-Reply-To: <20240415104802.6765bcdb@kernel.org>
References: <20240415104802.6765bcdb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hello Jakub,

My intention was to simplify it and reduce the delays, because two
consecutive resets were used at initialization, one from bind (the one
initially called during probe) and one from open.
Indeed my initial idea was to let the one from bind/probe only but reset
operation had to be removed from driver_info and that is the reason why 
the one from open was choosen.
But the one from bind/probe is better in order to avoid the commented
issue. Let me try with this in a second version.

Thank you again

Best regards
José Ignacio


