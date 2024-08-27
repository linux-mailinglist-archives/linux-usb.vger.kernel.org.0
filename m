Return-Path: <linux-usb+bounces-14165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE8960515
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 11:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 582C7281119
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AC2194C62;
	Tue, 27 Aug 2024 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cs/c6qcR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ED013C9A9
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749498; cv=none; b=t2WfvRiG9kq7u9VSijw4/YBKdn7uEEOk3fHNcC/mCeidBoGKYmBZYm/Z+p2b7KmTiOVk9EZwOSEvj9XfOXu4/JrjxjLy/lf85ikXrDva82RvkOdkxYaeCLMcgSpCLbsVwkabGU+vnc4HKMHG2pDQceUTm3yLp1bgUGLJs8XVIDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749498; c=relaxed/simple;
	bh=LOQedF/DhcW0zS5mRe3OF0ajwvQUWiFJOS/awiyKd4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3HFiTwho59O/lWXEXgCmyTsh/ZMRENmlVpXNSaThtIKKhyrqS3P/FopmZVXFQfz2tUIdr1eIjgLzALoQr0kIBZczG63h0jECOdo2qtBkYB8eYkenv7hW1acR2d8q0Wn7RFSfol+z7qHQ58rL1dW085N8EIFPQN2GZtAwKAUAdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cs/c6qcR; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aa086b077so465794766b.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724749495; x=1725354295; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8HqIy0/AJlxZmUisJNV10waLKcb7SLKVa0IOBY2P/U=;
        b=cs/c6qcRtdSxuz5yFUu/aNg46QxoE7o9lXQ2+JVblGFReAYen3frVRPLOe0SmK3rBU
         58dRqCetPZb88lziof1tHgM4vGS6dQZbXuJ8LBn7hV5Fw5847nqd6KNtLp3XCqtWdmfU
         aj8yYwpONQQkLXeC4zq64Z2zvXLPGeUCnWhZ9UOrZIYTKmTd9i8+gslpMLcUMbtIC+xL
         PYzYf3PE9FrARk91h5b5eSWCBoNVJNvYg4Oxw7IyT9ckzKaSrJDd4WXbgBt2JeYJ5XqZ
         snG7PZyGnVMAVSRm/paVZiAhV+74L3c7sD1TpkQWpu4tbwDe22oq9c30KY+N/D2G37If
         Bmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749495; x=1725354295;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8HqIy0/AJlxZmUisJNV10waLKcb7SLKVa0IOBY2P/U=;
        b=TZPkSUCy4WPZmHSEj9U2n9PchIu5I9Zhvvmfa3Joe4GML9QY6es649ntaxKpJ0j/+x
         mrrRsEbQszhPdUXGGd1Q+wlM4wfTw7XrNXpwI3i5EOj3Unx7LlKhiFe6Hw1XFgwsJpHX
         n6kSTULBAOf7vmHflIMVdaCncBVwh2/rzcW7uF5dr8vXLWG1SQ2Y7qMnVus8ONNCrxlR
         Vn/4OEpuUiDojYRCcfQSYHEteu0CDSIXT5527vhF9/F9U1k8POyv2u0o3j48vytPF16Y
         7JOF4A91ZvUe3zkltwx7AC1EDdDcIROKoaqKBebi/i/PlExx+wYx/I+kUXDrScbPstIb
         gR8A==
X-Gm-Message-State: AOJu0YzcD+1HtA0M9c2dypAIIb56N8+xtqMJmdVBQAuwwVR0p1HaDBoU
	JMgHDLHxC42PI/Ft4RK7qyIfEjhc5UzAFjRwY0a/gaNPSAbg4j4hijDUcU77IEWsykYokk/TiO1
	a
X-Google-Smtp-Source: AGHT+IEOnpto1EHzyWjI94aUI18IKhY/qoiMvA18/SgWUqOx+7Cql6TJnS44wiQjc24xcOOllPj/IQ==
X-Received: by 2002:a17:907:7295:b0:a86:97c0:9bb3 with SMTP id a640c23a62f3a-a86a54b8d24mr1055217266b.51.1724749494784;
        Tue, 27 Aug 2024 02:04:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549ce0dsm83874766b.60.2024.08.27.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:04:54 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:04:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: ucsi: reorder operations in
 ucsi_run_command()
Message-ID: <392d6257-6c70-47e9-aac4-eca1af124c21@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dmitry Baryshkov,

Commit 6cbb7fc91085 ("usb: typec: ucsi: reorder operations in
ucsi_run_command()") from Jun 27, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/usb/typec/ucsi/ucsi.c:151 ucsi_read_error()
	error: uninitialized symbol 'error'.

drivers/usb/typec/ucsi/ucsi.c
    95  static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
    96                              void *data, size_t size, bool conn_ack)
    97  {
    98          int ret, err;
    99  
   100          *cci = 0;
   101  
   102          if (size > UCSI_MAX_DATA_LENGTH(ucsi))
   103                  return -EINVAL;
   104  
   105          ret = ucsi->ops->sync_control(ucsi, command);
   106          if (ret)
   107                  return ret;
   108  
   109          ret = ucsi->ops->read_cci(ucsi, cci);
   110          if (ret)
   111                  return ret;
   112  
   113          if (*cci & UCSI_CCI_BUSY)
   114                  return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
   115  
   116          if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
   117                  return -EIO;
   118  
   119          if (*cci & UCSI_CCI_NOT_SUPPORTED)
   120                  err = -EOPNOTSUPP;
   121          else if (*cci & UCSI_CCI_ERROR)
   122                  err = -EIO;
   123          else
   124                  err = 0;
   125  
   126          if (!err && data && UCSI_CCI_LENGTH(*cci))
   127                  err = ucsi->ops->read_message_in(ucsi, data, size);

*data is only set when UCSI_CCI_LENGTH(*cci) is non-zero

   128  
   129          /*
   130           * Don't ACK connection change if there was an error.
   131           */
   132          ret = ucsi_acknowledge(ucsi, err ? false : conn_ack);
   133          if (ret)
   134                  return ret;
   135  
   136          return err ?: UCSI_CCI_LENGTH(*cci);

We return zero if err isn't set and UCSI_CCI_LENGTH(*cci) is zero.  There
should probably be a check somewhere that if (!UCSI_CCI_LENGTH(*cci)) return
-EINVAL;

   137  }
   138  
   139  static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
   140  {
   141          u64 command;
   142          u16 error;
   143          u32 cci;
   144          int ret;
   145  
   146          command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
   147          ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
   148          if (ret < 0)
   149                  return ret;
   150  
   151          switch (error) {
                        ^^^^^
Uninitialized

   152          case UCSI_ERROR_INCOMPATIBLE_PARTNER:
   153                  return -EOPNOTSUPP;

regards,
dan carpenter

